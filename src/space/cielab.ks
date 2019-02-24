Color.registerSpace!({
	name: Space::CIELAB
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%-]/g, '')

				if match ?= /^cielaba?\(([0-9.]+),(-?[0-9.]+),(-?[0-9.]+)(?:,([0-9.]+)(\%)?)?(?:,(a|b|c|d50|d55|d65|d75|e|f2|f7|f11|(?:\([0-9.]+,[0-9.]+,[0-9.]+\))))?(?:,(2|10))?\)$/.exec(color) {
					that._space = Space::CIELAB
					that._luma = $caster.float(match[1], 100)
					that._astar = $caster.real(match[2], -128, 127)
					that._bstar = $caster.real(match[3], -128, 127)
					that._alpha = $caster.alpha(match[4], match[5])
					that._observer = $caster.observer(match[7])
					that._illuminant = $caster.illuminant(match[6], 'D65', that._observer)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::CIELAB
			that._luma = $caster.float(args[0], 100)
			that._astar = $caster.real(args[1], -128, 127)
			that._bstar = $caster.real(args[2], -128, 127)
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
			return `cielab(\(that._luma), \(that._astar), \(that._bstar), \(that._illuminant), \(that._observer))`
		}
		else {
			return `cielab(\(that._luma), \(that._astar), \(that._bstar), \(that._alpha), \(that._illuminant), \(that._observer))`
		}
	} // }}}
	converters: {
		from: {
			[Space::CIEXYZ](y, x, z, illuminant, observer, that) { // {{{
				const wp = illuminant is String ? $whitePoints[observer][illuminant] : illuminant

				x /= wp[0]
				y /= wp[1]
				z /= wp[2]

				if x > $epsilon {
					x = Math.pow(x, 1/3)
				}
				else {
					x = (($kappa * x) + 16) / 116
				}
				if y > $epsilon {
					y = Math.pow(y, 1/3)
				}
				else {
					y = (($kappa * y) + 16) / 116
				}
				if z > $epsilon {
					z = Math.pow(z, 1/3)
				}
				else {
					z = (($kappa * z) + 16) / 116
				}

				that._luma = $caster.float((116 * y) - 16, 100)
				that._astar = $caster.real(500 * (x - y), -128, 127)
				that._bstar = $caster.real(200 * (y - z), -128, 127)

				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
		to: {
			[Space::CIEXYZ](luma, astar, bstar, illuminant, observer, that) { // {{{
				let y = (luma + 16) / 116
				let x = (astar / 500) + y
				let z = y - (bstar / 200)

				let p
				if (p = Math.pow(x, 3)) > $epsilon {
					x = p
				}
				else {
					x = ((116 * x) - 16) / $kappa
				}

				if luma > 8 {
					y = Math.pow(y, 3)
				}
				else {
					y = luma / $kappa
				}

				if (p = Math.pow(z, 3)) > $epsilon {
					z = p
				}
				else {
					z = ((116 * z) - 16) / $kappa
				}

				const wp = illuminant is String ? $whitePoints[observer][illuminant] : illuminant

				that._x = $caster.float(x * wp[0], 127)
				that._luma = $caster.float(y * wp[1], 100)
				that._z = $caster.float(z * wp[2], 127)

				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
	}
	components: {
		luma: {
			family: Space::CIEXYZ
		}
		astar: {
			min: -128
			max: 127
			round: 4
		}
		bstar: {
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