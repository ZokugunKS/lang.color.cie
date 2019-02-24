import '@zokugun/lang'
import '@zokugun/lang.color'
import '@zokugun/lang.math.matrix'

enum Space {
	CIELAB
	CIELCH_AB = 'cielch(ab)'
	CIELCH_UV = 'cielch(uv)'
	CIELUV
	CIEYXY
	CIEXYZ
}

include {
	'./util.ks'

	'./space/ciexyz.ks'
	'./space/cieyxy.ks'
	'./space/cielab.ks'
	'./space/cieluv.ks'
	'./space/cielch_ab.ks'
	'./space/cielch_uv.ks'
}

impl Color {
	#[error(off)]
	illuminant(value, method = null) { // {{{
		this.space(Space::CIEXYZ)

		value = $caster.illuminant(value, this._illuminant, this._observer)

		if value != this._illuminant {
			const dst = $adapt(this._x, this._luma, this._z, this._illuminant, value, this._observer, this._observer, method)

			this._illuminant = value
			this._luma = $caster.float(dst[1], 100)
			this._x = $caster.float(dst[0], 127)
			this._z = $caster.float(dst[2], 127)
		}

		return this
	} // }}}
	#[error(off)]
	observer(value, method = null) { // {{{
		this.space(Space::CIEXYZ)

		value = $caster.observer(value, this._observer)

		if value != this._observer {
			if this._illuminant is String {
				const dst = $adapt(this._x, this._luma, this._z, this._illuminant, this._illuminant, this._observer, value, method)

				this._luma = $caster.float(dst[1], 100)
				this._x = $caster.float(dst[0], 127)
				this._z = $caster.float(dst[2], 127)
			}

			this._observer = value
		}

		return this
	} // }}}
}

export Color, Space