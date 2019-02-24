#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('parse', func() {
	describe('ciexyz', func() {
		it('ciexyz(11.293, 11, 12.837)', func() { // {{{
			const c = new Color('ciexyz(11.293, 11, 12.837)')

			expect(c.format()).to.equal('ciexyz(11.293, 11, 12.837, D65, 2)')
		}) // }}}

		it('ciexyz, 11.293, 11, 12.837', func() { // {{{
			const c = new Color('ciexyz', 11.293, 11, 12.837)

			expect(c.format()).to.equal('ciexyz(11.293, 11, 12.837, D65, 2)')
		}) // }}}

		it('{x:11.293, y:11, z:12.837}', func() { // {{{
			const c = new Color({x:11.293, y:11, z:12.837})

			expect(c.format()).to.equal('ciexyz(11.293, 11, 12.837, D65, 2)')
		}) // }}}

		it('ciexyz(31.575, 16.273, 1.590, A)', func() { // {{{
			const c = new Color('ciexyz(31.575, 16.273, 1.590, A)')

			expect(c.format()).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')
		}) // }}}

		it('ciexyz, 31.575, 16.273, 1.590, A', func() { // {{{
			const c = new Color('ciexyz', 31.575, 16.273, 1.590, 'A')

			expect(c.format()).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')
		}) // }}}

		it('ciexyz(31.575, 16.273, 1.590, (109.85, 100, 35.585))', func() { // {{{
			const c = new Color('ciexyz(31.575, 16.273, 1.590, (109.85, 100, 35.585))')

			expect(c.format()).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')
		}) // }}}

		it('ciexyz, 31.575, 16.273, 1.590, (109.85, 100, 35.585)', func() { // {{{
			const c = new Color('ciexyz', 31.575, 16.273, 1.590, '109.85, 100, 35.585')

			expect(c.format()).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')
		}) // }}}

		it('ciexyz, 31.575, 16.273, 1.590, [109.85, 100, 35.585]', func() { // {{{
			const c = new Color('ciexyz', 31.575, 16.273, 1.590, [109.85, 100, 35.585])

			expect(c.format()).to.equal('ciexyz(31.575, 16.273, 1.59, A, 2)')
		}) // }}}
	})

	describe('cieyxy', func() {
		it('cieyxy(11, 32.146, 31.312)', func() { // {{{
			const c = new Color('cieyxy(11, 32.146, 31.312)')

			expect(c.format()).to.equal('cieyxy(11, 32.146, 31.312, D65, 2)')
		}) // }}}

		it('cieyxy, 11, 32.146, 31.312', func() { // {{{
			const c = new Color('cieyxy', 11, 32.146, 31.312)

			expect(c.format()).to.equal('cieyxy(11, 32.146, 31.312, D65, 2)')
		}) // }}}
	})

	describe('cielab', func() {
		it('cielab(39.581, 6.233, -2.239)', func() { // {{{
			const c = new Color('cielab(39.581, 6.233, -2.239)')

			expect(c.format()).to.equal('cielab(39.581, 6.233, -2.239, D65, 2)')
		}) // }}}

		it('cielab, 39.581, 6.233, -2.239', func() { // {{{
			const c = new Color('cielab', 39.581, 6.233, -2.239)

			expect(c.format()).to.equal('cielab(39.581, 6.233, -2.239, D65, 2)')
		}) // }}}
	})

	describe('cieluv', func() {
		it('cieluv(39.5808, 6.4091, -3.8343)', func() { // {{{
			const c = new Color('cieluv(39.5808, 6.4091, -3.8343)')

			expect(c.format()).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}

		it('cieluv, 39.5808, 6.4091, -3.8343', func() { // {{{
			const c = new Color('cieluv', 39.5808, 6.4091, -3.8343)

			expect(c.format()).to.equal('cieluv(39.5808, 6.4091, -3.8343, D65, 2)')
		}) // }}}
	})

	describe('cielch(ab)', func() {
		it('cielch(ab)(39.5808, 6.6267, 340.237)', func() { // {{{
			const c = new Color('cielch(ab)(39.5808, 6.6267, 340.237)')

			expect(c.format()).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}

		it('cielch(ab), 39.5808, 6.6267, 340.237', func() { // {{{
			const c = new Color('cielch(ab)', 39.5808, 6.6267, 340.237)

			expect(c.format()).to.equal('cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)')
		}) // }}}
	})

	describe('cielch(uv)', func() {
		it('cielch(uv)(39.5808, 7.4685, 329.1097)', func() { // {{{
			const c = new Color('cielch(uv)(39.5808, 7.4685, 329.1097)')

			expect(c.format()).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}

		it('cielch(uv), 39.5808, 7.4685, 329.1097', func() { // {{{
			const c = new Color('cielch(uv)', 39.5808, 7.4685, 329.1097)

			expect(c.format()).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)')
		}) // }}}
	})
})