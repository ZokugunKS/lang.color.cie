extern {
	func parseFloat(...): Number
	func parseInt(...): Number
	console
}

const $whitePoints = { // {{{
	'2': {
		A: [109.85, 100, 35.585]
		B: [99.072, 100, 85.223]
		C: [98.074, 100, 118.232]
		D50: [96.422, 100, 82.521]
		D55: [95.682, 100, 92.149]
		D65: [95.047, 100, 108.883]
		D75: [94.972, 100, 122.638]
		E: [100, 100, 100]
		F1: [94.8788, 100, 108.1515]
		F2: [99.186, 100, 67.393]
		F3: [103.7535, 100, 49.8605]
		F4: [109.1473, 100, 38.8133]
		F5: [90.872, 100, 98.7229]
		F6: [97.3091, 100, 60.1905]
		F7: [95.041, 100, 108.747]
		F8: [96.4125, 100, 82.3331]
		F9: [100.3648, 100, 67.8684]
		F10: [96.1735, 100, 81.7123]
		F11: [100.962, 100, 64.350]
		F12: [108.0463, 100, 39.2275]
	}
	'10': {
		A: [111.144, 100, 35.2]
		B: [99.1778, 100, 84.3493]
		C: [97.285, 100, 116.145]
		D50: [96.72, 100, 81.427]
		D55: [95.799, 100, 90.923]
		D65: [94.811, 100, 107.304]
		D75: [94.416, 100, 120.641]
		E: [100, 100, 100]
		F1: [94.7913, 100, 103.1914]
		F2: [103.279, 100, 69.027]
		F3: [108.9683, 100, 51.9648]
		F4: [114.9614, 100, 40.9633]
		F5: [93.3686, 100, 98.6363]
		F6: [102.1481, 100, 62.0736]
		F7: [95.792, 100, 107.686]
		F8: [97.1146, 100, 81.1347]
		F9: [102.1163, 100, 67.8256]
		F10: [99.0012, 100, 83.134]
		F11: [103.863, 100, 65.607]
		F12: [111.4284, 100, 40.353]
	}
} // }}}

const $whitePointAliases = { // {{{
	'2': {
		'109.85,100,35.585': 'A'
		'99.072,100,85.223': 'B'
		'98.074,100,118.232': 'C'
		'96.422,100,82.521': 'D50'
		'95.682,100,92.149': 'D55'
		'95.047,100,108.883': 'D65'
		'94.972,100,122.638': 'D75'
		'100,100,100': 'E'
		'94.8788,100,108.1515': 'F1'
		'99.186,100,67.393': 'F2'
		'103.7535,100,49.8605': 'F3'
		'109.1473,100,38.8133': 'F4'
		'90.872,100,98.7229': 'F5'
		'97.3091,100,60.1905': 'F6'
		'95.041,100,108.747': 'F7'
		'96.4125,100,82.3331': 'F7'
		'100.3648,100,67.8684': 'F8'
		'96.1735,100,81.7123': 'F10'
		'100.962,100,64.350': 'F11'
		'108.0463,100,39.2275': 'F12'
	}
	'10': {
		'111.144,100,35.2': 'A'
		'99.1778,100,84.3493': 'B'
		'97.285,100,116.145': 'C'
		'96.72,100,81.427': 'D50'
		'95.799,100,90.923': 'D55'
		'94.811,100,107.304': 'D65'
		'94.416,100,120.641': 'D75'
		'100,100,100': 'E'
		'94.7913,100,103.1914': 'F1'
		'103.279,100,69.027': 'F2'
		'108.9683,100,51.9648': 'F3'
		'114.9614,100,40.9633': 'F4'
		'93.3686,100,98.6363': 'F5'
		'102.1481,100,62.0736': 'F6'
		'95.792,100,107.686': 'F7'
		'97.1146,100,81.1347': 'F8'
		'102.1163,100,67.8256': 'F9'
		'99.0012,100,83.134': 'F10'
		'103.863,100,65.607': 'F11'
		'111.4284,100,40.353': 'F12'
	}
} // }}}

const $chromaticAdaptationMatrices = { // {{{
	xyzscaling: [[1,0,0],[0,1,0],[0,0,1]]
	bradford: [[0.895100,-0.750200,0.038900],[0.266400,1.713500,-0.068500],[-0.161400,0.036700,1.029600]]
	vonkries: [[0.400240,-0.226300,0],[0.707600,1.165320,0],[-0.080810,0.045700,0.918220]]
} // }}}

const $inversedChromaticAdaptationMatrices = { // {{{
	xyzscaling: [[1,0,0],[0,1,0],[0,0,1]]
	bradford: [[0.986993,0.432305,-0.008529],[-0.147054,0.518360,0.040043],[0.159963,0.049291,0.968487]]
	vonkries: [[1.859936,0.361191,0],[-1.129382,0.638812,0],[0.219897,-0.000006,1.089064]]
} // }}}

const $adaptationMatrices = {}

const $epsilon = 216 / 24389
const $kappa = 24389 / 27

const $rad2degree = 180 / Math.PI
const $degree2rad = Math.PI / 180

const $caster = {
	alpha(n?, percentage = null) { // {{{
		n = parseFloat(n)

		if n == NaN {
			return 1
		}

		return (?percentage ? n / 100 : n).limit(0, 1).round(3)
	} // }}}
	ff(n) => parseFloat(n).limit(0, 255).round()
	float(n, m) => parseFloat(n).limit(0, m).round(4)
	illuminant(n?, defaultValue, observer) { // {{{
		if n? {
			if n is String && $whitePoints[observer][n = n.toUpperCase()] {
				return n
			}
			else {
				if n is String {
					n = n.replace(/[^0-9,.]/g, '').split(',')
				}

				if n is Array && n.length == 3 {
					n[0] = $caster.float(n[0], 127)
					n[1] = $caster.float(n[1], 100)
					n[2] = $caster.float(n[2], 127)

					if alias ?= $whitePointAliases[observer][n.join(',')] {
						return alias
					}
					else {
						return n
					}
				}
			}
		}

		return defaultValue || null
	} // }}}
	loop(n, m) => parseFloat(n).mod(360).round(4)
	observer(n?) { // {{{
		n = parseInt(n)

		if n == 2 || n == 10 {
			return n
		}
		else {
			return 2
		}
	} // }}}
	real(n, min, max) => parseFloat(n).limit(min, max).round(4)
}

func $adapt(x, y, z, oldIlluminant, newIlluminant, oldObserver, newObserver, method = 'bradford') { // {{{
	method = method.replace(/s/g, '').toLowerCase()

	if !$chromaticAdaptationMatrices[method] {
		methdo = 'bradford'
	}

	const oldName = (oldIlluminant is String ? oldIlluminant : oldIlluminant.join(',')) + '_' + oldObserver
	const newName = (newIlluminant is String ? newIlluminant : newIlluminant.join(',')) + '_' + newObserver

	let m
	if $adaptationMatrices[method] && $adaptationMatrices[method][oldName] && $adaptationMatrices[method][oldName][newName] {
		m = $adaptationMatrices[method][oldName][newName]
	}
	else {
		const ma = $chromaticAdaptationMatrices[method]

		const srcWhite = oldIlluminant is String ? $whitePoints[oldObserver][oldIlluminant] : oldIlluminant
		const dstWhite = newIlluminant is String ? $whitePoints[newObserver][newIlluminant] : newIlluminant

		const srcDomain = Matrix.multiply(srcWhite, ma)
		const dstDomain = Matrix.multiply(dstWhite, ma)

		const domainCenter = [
			[dstDomain[0] / srcDomain[0], 0, 0]
			[0, dstDomain[1] / srcDomain[1], 0]
			[0, 0, dstDomain[2] / srcDomain[2]]
		]

		m = Matrix.multiply(Matrix.multiply(ma, domainCenter), $inversedChromaticAdaptationMatrices[method])

		if !$adaptationMatrices[method] {
			$adaptationMatrices[method] = {}
		}
		if !$adaptationMatrices[method][oldName] {
			$adaptationMatrices[method][oldName] = {}
		}
		$adaptationMatrices[method][oldName][newName] = m
	}

	return Matrix.multiply([x, y, z], m)
} // }}}
