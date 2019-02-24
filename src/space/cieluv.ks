Color.registerSpace!({
	name: Space::CIELUV
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%-]/g, '')

				if match ?= /^cieluva?\(([0-9.]+),(-?[0-9.]+),(-?[0-9.]+)(?:,([0-9.]+)(\%)?)?(?:,(a|b|c|d50|d55|d65|d75|e|f2|f7|f11|(?:\([0-9.]+,[0-9.]+,[0-9.]+\))))?(?:,(2|10))?\)$/.exec(color) {
					that._space = Space::CIELUV
					that._luma = $caster.float(match[1], 100)
					that._ustar = $caster.real(match[2], -128, 127)
					that._vstar = $caster.real(match[3], -128, 127)
					that._alpha = $caster.alpha(match[4], match[5])
					that._observer = $caster.observer(match[7])
					that._illuminant = $caster.illuminant(match[6], 'D65', that._observer)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::CIELUV
			that._luma = $caster.float(args[0], 100)
			that._ustar = $caster.real(args[1], -128, 127)
			that._vstar = $caster.real(args[2], -128, 127)
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
			return `cieluv(\(that._luma), \(that._ustar), \(that._vstar), \(that._illuminant), \(that._observer))`
		}
		else {
			return `cieluva(\(that._luma), \(that._ustar), \(that._vstar), \( that._alpha), \(that._illuminant), \(that._observer))`
		}
	} // }}}
	converters: {
		from: {
			[Space::CIEXYZ](y, x, z, illuminant, observer, that) { // {{{
				const wp = illuminant is String ? $whitePoints[observer][illuminant] : illuminant

				const d = x + (15 * y) + (3 * z)
				const dwp = wp[0] + (15 * wp[1]) + (3 * wp[2])

				const u = ((4 * x) / d) - ((4 * wp[0]) / dwp)
				const v = ((9 * y) / d) - ((9 * wp[1]) / dwp)

				y /= wp[1]

				if y > $epsilon {
					y = (116 * Math.pow(y, 1/3)) - 16
				}
				else {
					y = $kappa * y
				}

				that._luma = $caster.float(y, 100)
				that._ustar = $caster.real(13 * y * u, -128, 127)
				that._vstar = $caster.real(13 * y * v, -128, 127)

				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
		to: {
			[Space::CIEXYZ](luma, ustar, vstar, illuminant, observer, that) { // {{{
				const wp = illuminant is String ? $whitePoints[observer][illuminant] : illuminant

				let y
				if luma > $epsilon * $kappa {
					y = Math.pow((luma + 16) / 116, 3) * 100
				}
				else {
					y = (luma / $kappa) * 100
				}

				const dwp = wp[0] + (15 * wp[1]) + (3 * wp[2])
				const du = (4 * wp[0]) / dwp
				const dv = (9 * wp[1]) / dwp

				const a = (((52 * luma) / (ustar + (13 * luma * du))) - 1) / 3
				const b = -5 * y
				const c = -1 / 3
				const d = y * (((39 * luma) / (vstar + (13 * luma * dv))) - 5)

				const x = (d - b) / (a - c)

				that._x = $caster.float(x, 127)
				that._z = $caster.float((that._x * a) + b, 127)
				that._luma = $caster.float(y, 100)

				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
	}
	components: {
		luma: {
			family: Space::CIEXYZ
		}
		ustar: {
			min: -128
			max: 127
			round: 4
		}
		vstar: {
			min: -128
			max: 127
			round: 4
		}
		illuminant: {
			family: Space::CIEXYZ
		}
		observer: {
			family: Space::CIEXYZ
		}
	}
})