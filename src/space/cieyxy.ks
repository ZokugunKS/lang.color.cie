Color.registerSpace!({
	name: Space::CIEYXY
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%]/g, '')

				if match ?= /^cieyxya?\(([0-9.]+),([0-9.]+),([0-9.]+)(?:,([0-9.]+)(\%)?)?(?:,(a|b|c|d50|d55|d65|d75|e|f2|f7|f11|(?:\([0-9.]+,[0-9.]+,[0-9.]+\))))?(?:,(2|10))?\)$/.exec(color) {
					that._space = Space::CIEYXY
					that._luma = $caster.float(match[1], 100)
					that._x = $caster.float(match[2], 100)
					that._y = $caster.float(match[3], 100)
					that._alpha = $caster.alpha(match[4], match[5])
					that._observer = $caster.observer(match[7])
					that._illuminant = $caster.illuminant(match[6], 'D65', that._observer)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::CIEYXY
			that._luma = $caster.float(args[0], 100)
			that._x = $caster.float(args[1], 100)
			that._y = $caster.float(args[2], 100)
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
			return `cieyxy(\(that._luma), \(that._x), \(that._y), \(that._illuminant), \(that._observer))`
		}
		else {
			return `cieyxya(\(that._luma), \(that._x), \(that._y), \(that._alpha), \(that._illuminant), \(that._observer))`
		}
	} // }}}
	converters: {
		from: {
			[Space::CIEXYZ](luma, x, z, illuminant, observer, that) { // {{{
				that._luma = luma
				that._x = $caster.float((x / (x + luma + z)) * 100, 100)
				that._y = $caster.float((luma / (x + luma + z)) * 100, 100)
				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
		to: {
			[Space::CIEXYZ](luma, x, y, illuminant, observer, that) { // {{{
				that._luma = luma
				that._x = $caster.float((x * luma) / y, 127)
				that._z = $caster.float(((100 - x - y) * luma) / y, 127)
				that._illuminant = illuminant
				that._observer = observer
			} // }}}
		}
	}
	components: {
		luma: {
			family: Space::CIEXYZ
		}
		x: {
			max: 100
			round: 4
		}
		y: {
			max: 100
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