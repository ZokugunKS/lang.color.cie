#![bin]
#![error(off)]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('operation', func() {
	it('illuminant(srgb)', func() { // {{{
		const c = new Color('ciexyz', 11.2933, 11.0002, 12.8373, 'F4')

		expect(c.hex()).to.not.equal('#665a61')
		expect(c.hex()).to.equal('#3d60a4')
	}) // }}}

	it('illuminant(A, C)', func() { // {{{
		const c = new Color('ciexyz', 31.575, 16.273, 1.590, 'A')

		expect(c.format('ciexyz')).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')
		expect(c.hex()).to.equal('#c9223a')

		c.illuminant('C')

		expect(c.format('ciexyz')).to.equal('ciexyz(25.795, 13.977, 5.8805, C, 2)')
	}) // }}}

	it('illuminant(A, C, A, C)', func() { // {{{
		const c = new Color('ciexyz', 31.575, 16.273, 1.590, 'A')

		expect(c.format('ciexyz')).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')

		c.illuminant('C')

		expect(c.format('ciexyz')).to.equal('ciexyz(25.795, 13.977, 5.8805, C, 2)')

		c.illuminant('A')

		expect(c.format('ciexyz')).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')

		c.illuminant('C')

		expect(c.format('ciexyz')).to.equal('ciexyz(25.795, 13.977, 5.8805, C, 2)')
	}) // }}}

	it('observer(2, 10)', func() { // {{{
		const c = new Color('ciexyz', 31.575, 16.273, 1.590, 'A')

		expect(c.format('ciexyz')).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')
		expect(c.hex()).to.equal('#c9223a')

		c.observer('10')

		expect(c.format('ciexyz')).to.equal('ciexyz(31.9057, 16.3912, 1.5681, A, 10)')
		expect(c.hex()).to.equal('#c9223a')
	}) // }}}

	it('hex to cielch(uv)', func() { // {{{
		const c = new Color('#665a61').space('cielch(uv)')

		expect(c.luma()).to.equal(39.5808)
		expect(c.chroma()).to.equal(7.4685)
		expect(c.hue()).to.equal(329.1097)
		expect(c.format()).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
	}) // }}}
})