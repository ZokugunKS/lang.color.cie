#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('property', func() {
	it('astar()', func() { // {{{
		const c = new Color('cielab(39.5808, 6.2364, -2.2407)')

		expect(c.astar()).to.equal(6.2364)
	}) // }}}

	it('astar(50)', func() { // {{{
		const c = new Color('cielab', 39.5808, 6.2364, -2.2407)

		expect(c.hex()).to.equal('#665a61')

		expect(c.astar(50).hex()).to.equal('#a33363')
	}) // }}}

	it('bstar()', func() { // {{{
		const c = new Color('cielab(39.5808, 6.2364, -2.2407)')

		expect(c.bstar()).to.equal(-2.2407)
	}) // }}}

	it('bstar(50)', func() { // {{{
		const c = new Color('cielab', 39.5808, 6.2364, -2.2407)

		expect(c.hex()).to.equal('#665a61')

		expect(c.bstar(50).hex()).to.equal('#795800')
	}) // }}}

	it('chroma()', func() { // {{{
		const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237)')

		expect(c.chroma()).to.equal(6.6267)
	}) // }}}

	it('chroma(50)', func() { // {{{
		const c = new Color('cielch(ab)', 39.5808, 6.6267, 340.237)

		expect(c.hex()).to.equal('#665a61')

		expect(c.chroma(50).hex()).to.equal('#98397a')
	}) // }}}

	it('hue()', func() { // {{{
		const c = new Color('cielch(ab)', 39.5808, 6.6267, 340.237)

		expect(c.hue()).to.equal(340.237)
	}) // }}}

	it('hue(128)', func() { // {{{
		const c = new Color('cielch(ab)', 39.5808, 6.6267, 340.237)

		expect(c.hex()).to.equal('#665a61')

		expect(c.hue(128).hex()).to.equal('#5a5f55')
	}) // }}}

	it('illuminant()', func() { // {{{
		const c = new Color('ciexyz(11.2933, 11.0002, 12.8373)')

		expect(c.illuminant()).to.equal('D65')
	}) // }}}

	it('illuminant(F2)', func() { // {{{
		const c = new Color('ciexyz', 11.2933, 11.0002, 12.8373)

		expect(c.illuminant('F2').format()).to.equal('ciexyz(11.754, 11.0255, 7.9265, F2, 2)')
	}) // }}}

	it('luma()', func() { // {{{
		const c = new Color('ciexyz(11.2933, 11.0002, 12.8373)')

		expect(c.luma()).to.equal(11.0002)
	}) // }}}

	it('luma(50)', func() { // {{{
		const c = new Color('ciexyz', 11.2933, 11.0002, 12.8373)

		expect(c.hex()).to.equal('#665a61')

		expect(c.luma(50).hex()).to.equal('#00eb38')
	}) // }}}

	it('observer()', func() { // {{{
		const c = new Color('ciexyz(11.2933, 11.0002, 12.8373)')

		expect(c.observer()).to.equal(2)
	}) // }}}

	it('observer(10)', func() { // {{{
		const c = new Color('ciexyz', 11.2933, 11.0002, 12.8373, 'F4')

		expect(c.observer(10).format()).to.equal('ciexyz(11.9486, 10.9718, 13.6291, F4, 10)')
	}) // }}}

	it('ustar()', func() { // {{{
		const c = new Color('cieluv(39.5808, 6.4091, -3.8343)')

		expect(c.ustar()).to.equal(6.4091)
	}) // }}}

	it('ustar(50)', func() { // {{{
		const c = new Color('cieluv(39.5808, 6.4091, -3.8343)')

		expect(c.hex()).to.equal('#665a61')

		expect(c.ustar(50).hex()).to.equal('#92445c')
	}) // }}}

	it('vstar()', func() { // {{{
		const c = new Color('cieluv(39.5808, 6.4091, -3.8343)')

		expect(c.vstar()).to.equal(-3.8343)
	}) // }}}

	it('vstar(50)', func() { // {{{
		const c = new Color('cieluv(39.5808, 6.4091, -3.8343)')

		expect(c.hex()).to.equal('#665a61')

		expect(c.vstar(50).hex()).to.equal('#646000')
	}) // }}}

	it('x()', func() { // {{{
		const c = new Color('ciexyz(11.2933, 11.0002, 12.8373)')

		expect(c.x()).to.equal(11.2933)
	}) // }}}

	it('x(50)', func() { // {{{
		const c = new Color('ciexyz', 11.2933, 11.0002, 12.8373)

		expect(c.hex()).to.equal('#665a61')

		expect(c.x(50).hex()).to.equal('#ff0069')
	}) // }}}

	it('y()', func() { // {{{
		const c = new Color('cieyxy(11.0002, 32.1464, 31.3121)')

		expect(c.y()).to.equal(31.3121)
	}) // }}}

	it('y(50)', func() { // {{{
		const c = new Color('cieyxy(11.0002, 32.1464, 31.3121)')

		expect(c.hex()).to.equal('#665a61')

		expect(c.y(50).hex()).to.equal('#39682a')
	}) // }}}

	it('z()', func() { // {{{
		const c = new Color('ciexyz', 11.2933, 11.0002, 12.8373)

		expect(c.z()).to.equal(12.8373)
	}) // }}}

	it('z(50)', func() { // {{{
		const c = new Color('ciexyz', 11.2933, 11.0002, 12.8373)

		expect(c.hex()).to.equal('#665a61')

		expect(c.z(50).hex()).to.equal('#0060be')
	}) // }}}
})