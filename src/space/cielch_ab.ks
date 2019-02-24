Color.registerSpace!({
	name: Space::CIELCH_AB
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%-]/g, '')

				if match ?= /^cielcha?\(ab\)\(([0-9.]+),(-?[0-9.]+),(-?[0-9.]+)(?:,([0-9.]+)(\%)?)?(?:,(a|b|c|d50|d55|d65|d75|e|f2|f7|f11|(?:\([0-9.]+,[0-9.]+,[0-9.]+\))))?(?:,(2|10))?\)$/.exec(color) {
					that._space = Space::CIELCH_AB
					that._luma = $caster.float(match[1], 100)
					that._chroma = $caster.float(match[2], 100)
					that._hue = $caster.loop(match[3], 360)
					that._alpha = $caster.alpha(match[4], match[5])
					that._observer = $caster.observer(match[7])
					that._illuminant = $caster.illuminant(match[6], 'D65', that._observer)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::CIELCH_AB
			that._luma = $caster.float(args[0], 100)
			that._chroma = $caster.float(args[1], 100)
			that._hue = $caster.loop(args[2], 360)
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
			return `cielch(ab)(\(that._luma), \(that._chroma), \(that._hue), \(that._illuminant), \(that._observer))`
		}
		else {
			return `cielcha(ab)(\(that._luma), \(that._chroma), \(that._hue), \(that._alpha), \(that._illuminant), \(that._observer))`
		}
	} // }}}
	converters: {
		from: {
			[Space::CIELAB](luma, astar, bstar, illuminant, observer, that) { // {{{
				that._luma = luma
				that._chroma = $caster.float(Math.sqrt((astar * astar) + (bstar * bstar)), 100)
				that._hue = $caster.loop(Math.atan2(bstar, astar) * $rad2degree, 360)

				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
		to: {
			[Space::CIELAB](luma, chroma, hue, illuminant, observer, that) { // {{{
				const h = hue * $degree2rad

				that._luma = luma
				that._astar = $caster.real(chroma * Math.cos(h), -128, 127)
				that._bstar = $caster.real(chroma * Math.sin(h), -128, 127)

				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
	}
	components: {
		luma: {
			family: Space::CIEXYZ
		}
		chroma: {
			max: 100
			round: 4
		}
		hue: {
			max: 359
			loop: true
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