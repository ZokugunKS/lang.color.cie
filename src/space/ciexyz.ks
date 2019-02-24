Color.registerSpace!({
	name: Space::CIEXYZ
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%]/g, '')

				if match ?= /^ciexyza?\(([0-9.]+),([0-9.]+),([0-9.]+)(?:,([0-9.]+)(\%)?)?(?:,(a|b|c|d50|d55|d65|d75|e|f2|f7|f11|(?:\([0-9.]+,[0-9.]+,[0-9.]+\))))?(?:,(2|10))?\)$/.exec(color) {
					that._space = Space::CIEXYZ
					that._luma = $caster.float(match[2], 100)
					that._x = $caster.float(match[1], 127)
					that._z = $caster.float(match[3], 127)
					that._alpha = $caster.alpha(match[4], match[5])
					that._observer = $caster.observer(match[7])
					that._illuminant = $caster.illuminant(match[6], 'D65', that._observer)
					return true
				}
			}
			else if args[0] is Object {
				if args[0].x? && args[0].y? && args[0].z? {
					that._space = Space::CIEXYZ
					that._luma = $caster.float(args[0].y, 100)
					that._x = $caster.float(args[0].x, 127)
					that._z = $caster.float(args[0].z, 127)
					that._alpha = $caster.alpha(args[0].a || args[0].alpha)
					that._observer = $caster.observer(args[0].observer)
					that._illuminant = $caster.illuminant(args[0].illuminant, 'D65', that._observer)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::CIEXYZ
			that._luma = $caster.float(args[1], 100)
			that._x = $caster.float(args[0], 127)
			that._z = $caster.float(args[2], 127)
			that._alpha = 1
			that._observer = 2

			let illuminant
			if args.length >= 4 {
				if Type.isNumeric(args[3]) {
					that._alpha = $caster.alpha(args[3])

					if args.length >= 5 {
						illuminant = args[4]

						if args.length >= 6 {
							that._observer = $caster.observer(args[5])
						}
					}
				}
				else {
					illuminant = args[3]

					if args.length >= 5 {
						that._observer = $caster.observer(args[4])
					}
				}
			}

			that._illuminant = $caster.illuminant(illuminant, 'D65', that._observer)

			return true
		}
	} // }}}
	formatter(that) { // {{{
		if that._alpha == 1 {
			return `ciexyz(\(that._x), \(that._luma), \(that._z), \(that._illuminant), \(that._observer))`
		}
		else {
			return `ciexyza(\(that._x), \(that._luma), \(that._z), \(that._alpha), \(that._illuminant), \(that._observer))`
		}
	} // }}}
	converters: {
		from: {
			[Space::SRGB](red, green, blue, that) { // {{{
				let r = red / 255
				let g = green / 255
				let b = blue / 255

				if r > 0.04045 {
					r = Math.pow(((r + 0.055) / 1.055), 2.4)
				}
				else {
					r = r / 12.92
				}
				if g > 0.04045 {
					g = Math.pow(((g + 0.055) / 1.055), 2.4)
				}
				else {
					g = g / 12.92
				}
				if b > 0.04045 {
					b = Math.pow(((b + 0.055) / 1.055), 2.4)
				}
				else {
					b = b / 12.92
				}

				r = r * 100
				g = g * 100
				b = b * 100

				that._x = $caster.float(r * 0.4124 + g * 0.3576 + b * 0.1805, 127)
				that._luma = $caster.float(r * 0.2126 + g * 0.7152 + b * 0.0722, 100)
				that._z = $caster.float(r * 0.0193 + g * 0.1192 + b * 0.9505, 127)
				that._illuminant = 'D65'
				that._observer = 2
			} // }}}
		}
		to: {
			[Space::SRGB](y, x, z, illuminant, observer, that) { // {{{
				if illuminant != 'D65' || observer != 2 {
					[x, y, z] = $adapt(x, y, z, illuminant, 'D65', observer, 2)
				}

				x /= 100
				y /= 100
				z /= 100

				let r = x * 3.2406 + y * -1.5372 + z * -0.4986
				let g = x * -0.9689 + y * 1.8758 + z * 0.0415
				let b = x * 0.0557 + y * -0.2040 + z * 1.0570

				if r > 0.0031308 {
					r = 1.055 * Math.pow(r, (1 / 2.4)) - 0.055
				}
				else {
					r *= 12.92
				}
				if g > 0.0031308 {
					g = 1.055 * Math.pow(g, (1 / 2.4)) - 0.055
				}
				else {
					g *= 12.92
				}
				if b > 0.0031308 {
					b = 1.055 * Math.pow(b, (1 / 2.4)) - 0.055
				}
				else {
					b *= 12.92
				}

				that._red = $caster.ff(r * 255)
				that._green = $caster.ff(g * 255)
				that._blue = $caster.ff(b * 255)
			} // }}}
		}
	}
	components: {
		luma: {
			max: 100
			round: 4
		}
		x: {
			max: 127
			round: 4
		}
		z: {
			max: 127
			round: 4
		}
		illuminant: {
			type: 'Array | String'
			mutator: true
		}
		observer: {
			mutator: true
		}
	}
})