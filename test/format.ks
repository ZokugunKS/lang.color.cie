#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('format', func() {
	describe('hex', func() {
		it('ciexyz', func() { // {{{
			const c = new Color('#665a61')

			expect(c.format('ciexyz')).to.equal('ciexyz(11.2933, 11.0002, 12.8373, D65, 2)')
		}) // }}}

		it('cieyxy', func() { // {{{
			const c = new Color('#665a61')

			expect(c.format('cieyxy')).to.equal('cieyxy(11.0002, 32.1464, 31.3121, D65, 2)')
		}) // }}}

		it('cielab', func() { // {{{
			const c = new Color('#665a61')

			expect(c.format('cielab')).to.equal('cielab(39.5808, 6.2364, -2.2407, D65, 2)')
		}) // }}}

		it('cieluv', func() { // {{{
			const c = new Color('#665a61')

			expect(c.format('cieluv')).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}

		it('cielch(ab)', func() { // {{{
			const c = new Color('#665a61')

			expect(c.format('cielch(ab)')).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}

		it('cielch(uv)', func() { // {{{
			const c = new Color('#665a61')

			expect(c.format('cielch(uv)')).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}
	})

	describe('ciexyz', func() {
		it('hex', func() { // {{{
			const c = new Color('ciexyz(11.2933, 11.0002, 12.8373, D65)')

			expect(c.hex()).to.equal('#665a61')
		}) // }}}

		it('cieyxy', func() { // {{{
			const c = new Color('ciexyz(11.2933, 11.0002, 12.8373, D65)')

			expect(c.format('cieyxy')).to.equal('cieyxy(11.0002, 32.1464, 31.3121, D65, 2)')
		}) // }}}

		it('cielab', func() { // {{{
			const c = new Color('ciexyz(11.2933, 11.0002, 12.8373, D65)')

			expect(c.format('cielab')).to.equal('cielab(39.5808, 6.2364, -2.2407, D65, 2)')
		}) // }}}

		it('cieluv', func() { // {{{
			const c = new Color('ciexyz(11.2933, 11.0002, 12.8373, D65)')

			expect(c.format('cieluv')).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}

		it('cielch(ab)', func() { // {{{
			const c = new Color('ciexyz(11.2933, 11.0002, 12.8373, D65)')

			expect(c.format('cielch(ab)')).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}

		it('cielch(uv)', func() { // {{{
			const c = new Color('ciexyz(11.2933, 11.0002, 12.8373, D65)')

			expect(c.format('cielch(uv)')).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}
	})

	describe('cieyxy', func() {
		it('hex', func() { // {{{
			const c = new Color('cieyxy(11.0002, 32.1464, 31.3121, D65)')

			expect(c.hex()).to.equal('#665a61')
		}) // }}}

		it('ciexyz', func() { // {{{
			const c = new Color('cieyxy(11.0002, 32.1464, 31.3121, D65)')

			expect(c.format('ciexyz')).to.equal('ciexyz(11.2933, 11.0002, 12.8373, D65, 2)')
		}) // }}}

		it('cielab', func() { // {{{
			const c = new Color('cieyxy(11.0002, 32.1464, 31.3121, D65)')

			expect(c.format('cielab')).to.equal('cielab(39.5808, 6.2364, -2.2407, D65, 2)')
		}) // }}}

		it('cieluv', func() { // {{{
			const c = new Color('cieyxy(11.0002, 32.1464, 31.3121, D65)')

			expect(c.format('cieluv')).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}

		it('cielch(ab)', func() { // {{{
			const c = new Color('cieyxy(11.0002, 32.1464, 31.3121, D65)')

			expect(c.format('cielch(ab)')).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}

		it('cielch(uv)', func() { // {{{
			const c = new Color('cieyxy(11.0002, 32.1464, 31.3121, D65)')

			expect(c.format('cielch(uv)')).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}
	})

	describe('cielab', func() {
		it('hex', func() { // {{{
			const c = new Color('cielab(39.5808, 6.2364, -2.2407, D65)')

			expect(c.hex()).to.equal('#665a61')
		}) // }}}

		it('ciexyz', func() { // {{{
			const c = new Color('cielab(39.5808, 6.2364, -2.2407, D65)')

			expect(c.format('ciexyz')).to.equal('ciexyz(11.2933, 11.0002, 12.8373, D65, 2)')
		}) // }}}

		it('cieyxy', func() { // {{{
			const c = new Color('cielab(39.5808, 6.2364, -2.2407, D65)')

			expect(c.format('cieyxy')).to.equal('cieyxy(11.0002, 32.1464, 31.3121, D65, 2)')
		}) // }}}

		it('cieluv', func() { // {{{
			const c = new Color('cielab(39.5808, 6.2364, -2.2407, D65)')

			expect(c.format('cieluv')).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}

		it('cielch(ab)', func() { // {{{
			const c = new Color('cielab(39.5808, 6.2364, -2.2407, D65)')

			expect(c.format('cielch(ab)')).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}

		it('cielch(uv)', func() { // {{{
			const c = new Color('cielab(39.5808, 6.2364, -2.2407, D65)')

			expect(c.format('cielch(uv)')).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}
	})

	describe('cieluv', func() {
		it('hex', func() { // {{{
			const c = new Color('cieluv(39.5808, 6.4091, -3.8343, D65)')

			expect(c.hex()).to.equal('#665a61')
		}) // }}}

		it('ciexyz', func() { // {{{
			const c = new Color('cieluv(39.5808, 6.4091, -3.8343, D65)')

			expect(c.format('ciexyz')).to.equal('ciexyz(11.2933, 11.0002, 12.8373, D65, 2)')
		}) // }}}

		it('cieyxy', func() { // {{{
			const c = new Color('cieluv(39.5808, 6.4091, -3.8343, D65)')

			expect(c.format('cieyxy')).to.equal('cieyxy(11.0002, 32.1464, 31.3121, D65, 2)')
		}) // }}}

		it('cielab', func() { // {{{
			const c = new Color('cieluv(39.5808, 6.4091, -3.8343, D65)')

			expect(c.format('cielab')).to.equal('cielab(39.5808, 6.2364, -2.2407, D65, 2)')
		}) // }}}

		it('cielch(ab)', func() { // {{{
			const c = new Color('cieluv(39.5808, 6.4091, -3.8343, D65)')

			expect(c.format('cielch(ab)')).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}

		it('cielch(uv)', func() { // {{{
			const c = new Color('cieluv(39.5808, 6.4091, -3.8343, D65)')

			expect(c.format('cielch(uv)')).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}
	})

	describe('cielch(ab)', func() {
		it('hex', func() { // {{{
			const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')

			expect(c.hex()).to.equal('#665a61')
		}) // }}}

		it('ciexyz', func() { // {{{
			const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')

			expect(c.format('ciexyz')).to.equal('ciexyz(11.2933, 11.0002, 12.8373, D65, 2)')
		}) // }}}

		it('cieyxy', func() { // {{{
			const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')

			expect(c.format('cieyxy')).to.equal('cieyxy(11.0002, 32.1464, 31.3121, D65, 2)')
		}) // }}}

		it('cielab', func() { // {{{
			const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')

			expect(c.format('cielab')).to.equal('cielab(39.5808, 6.2364, -2.2407, D65, 2)')
		}) // }}}

		it('cieluv', func() { // {{{
			const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')

			expect(c.format('cieluv')).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}

		it('cielch(uv)', func() { // {{{
			const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')

			expect(c.format('cielch(uv)')).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}
	})

	describe('cielch(uv)', func() {
		it('hex', func() { // {{{
			const c = new Color('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')

			expect(c.hex()).to.equal('#665a61')
		}) // }}}

		it('ciexyz', func() { // {{{
			const c = new Color('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')

			expect(c.format('ciexyz')).to.equal('ciexyz(11.2933, 11.0002, 12.8373, D65, 2)')
		}) // }}}

		it('cieyxy', func() { // {{{
			const c = new Color('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')

			expect(c.format('cieyxy')).to.equal('cieyxy(11.0002, 32.1464, 31.3121, D65, 2)')
		}) // }}}

		it('cielab', func() { // {{{
			const c = new Color('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')

			expect(c.format('cielab')).to.equal('cielab(39.5808, 6.2364, -2.2407, D65, 2)')
		}) // }}}

		it('cieluv', func() { // {{{
			const c = new Color('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')

			expect(c.format('cieluv')).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}

		it('cielch(ab)', func() { // {{{
			const c = new Color('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')

			expect(c.format('cielch(ab)')).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}
	})
})