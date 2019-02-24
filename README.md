[@zokugun/lang.color.cie](https://github.com/ZokugunKS/lang.color.cie)
==============================================================

[![kaoscript](https://img.shields.io/badge/language-kaoscript-orange.svg)](https://github.com/kaoscript/kaoscript)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)
[![NPM Version](https://img.shields.io/npm/v/@zokugun/lang.color.cie.svg?colorB=green)](https://www.npmjs.com/package/@zokugun/lang.color.cie)
[![Dependency Status](https://badges.depfu.com/badges/d651a22b37a9214324d5f977b8ba1e53/overview.svg)](https://depfu.com/github/ZokugunKS/lang.color.cie)
[![Build Status](https://travis-ci.org/ZokugunKS/lang.color.cie.svg?branch=master)](https://travis-ci.org/ZokugunKS/lang.color.cie)
[![CircleCI](https://circleci.com/gh/ZokugunKS/lang.color.cie/tree/master.svg?style=shield)](https://circleci.com/gh/ZokugunKS/lang.color.cie/tree/master)
[![Coverage Status](https://img.shields.io/coveralls/ZokugunKS/lang.color.cie/master.svg)](https://coveralls.io/github/ZokugunKS/lang.color.cie)

Provides CIELAB, CIELUV, CIELCh, CIEXYZ, CIEYxy spaces.

Getting Started
---------------

With [node](http://nodejs.org) previously installed:

	npm install zokugun.lang.color.cie

Use it with `JavaScript`:

```javascript
require('kaoscript/register');

const { Color, Space } = require('@zokugun/lang.color.cie')();

const c = new Color('ciexyz(11.2933, 11.0002, 12.8373)');
```

Use it with `kaoscript`:
```kaoscript
import '@zokugun/lang.color.cie'

const c = new Color('ciexyz(11.2933, 11.0002, 12.8373)')
```

Properties
----------

A color is defined in a color space. If you try to access it into another space, the color will be automatically converted into the new space.

#### CIEXYZ

* `luma()`: *Number*
* `luma(Number)`: *Color*
* `x()`: *Number*
* `x(Number)`: *Color*
* `y()`: *Number*
* `y(Number)`: *Color*
* `illuminant()`: *String* or *XYZ*
* `illuminant(String|XYZ, String:method)`: *Color*
* `observer()`: *Number*
* `observer(Number, String:method)`: *Color*

#### CIEYxy

* `luma()`: *Number*
* `luma(Number)`: *Color*
* `x()`: *Number*
* `x(Number)`: *Color*
* `y()`: *Number*
* `y(Number)`: *Color*

#### CIELab

* `luma()`: *Number*
* `luma(Number)`: *Color*
* `astar()`: *Number*
* `astar(Number)`: *Color*
* `bstar()`: *Number*
* `bstar(Number)`: *Color*

#### CIELuv

* `luma()`: *Number*
* `luma(Number)`: *Color*
* `ustar()`: *Number*
* `ustar(Number)`: *Color*
* `vstar()`: *Number*
* `vstar(Number)`: *Color*

#### CIELCH(ab)

* `luma()`: *Number*
* `luma(Number)`: *Color*
* `chroma()`: *Number*
* `chroma(Number)`: *Color*
* `hue()`: *Number*
* `hue(Number)`: *Color*

#### CIELCH(uv)

* `luma()`: *Number*
* `luma(Number)`: *Color*
* `chroma()`: *Number*
* `chroma(Number)`: *Color*
* `hue()`: *Number*
* `hue(Number)`: *Color*

Illuminants & Observers
-----------------------

The CIE 1931 2° Standard Observer and the CIE 1964 10° Standard Observer are supported for the standard illuminants.

On a color with non-standard illuminant, changing the observer won't change the coordinates of the color.
But changing the illuminant, will always change the coordinates of the color.

SRGB is converted from/to CIEXYZ with the Standard Illuminant D65 and the 2° Standard Observer.

<table>
	<thead>
		<tr>
			<th rowspan="2">Name</th>
			<th colspan="3">2° Observer</th>
			<th colspan="3">10° Observer</th>
			<th rowspan="2">Note</th>
		</tr>
		<tr>
			<th>X</th>
			<th>Y</th>
			<th>Z</th>
			<th>X</th>
			<th>Y</th>
			<th>Z</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>A</td>
			<td>109.85</td>
			<td>100</td>
			<td>35.585</td>
			<td>111.144</td>
			<td>100</td>
			<td>35.2</td>
			<td>Incandescent / Tungsten</td>
		</tr>
		<tr>
			<td>B</td>
			<td>99.072</td>
			<td>100</td>
			<td>85.223</td>
			<td>99.1778</td>
			<td>100</td>
			<td>35.2</td>
			<td>Direct sunlight at noon (Deprecated)</td>
		</tr>
		<tr>
			<td>C</td>
			<td>98.074</td>
			<td>100</td>
			<td>118.232</td>
			<td>97.285</td>
			<td>100</td>
			<td>116.145</td>
			<td>Average / North sky Daylight (Deprecated)</td>
		</tr>
		<tr>
			<td>D50</td>
			<td>96.422</td>
			<td>100</td>
			<td>82.521</td>
			<td>96.72</td>
			<td>100</td>
			<td>81.427</td>
			<td>Horizon Light</td>
		</tr>
		<tr>
			<td>D55</td>
			<td>95.682</td>
			<td>100</td>
			<td>92.149</td>
			<td>95.799</td>
			<td>100</td>
			<td>90.923</td>
			<td>Mid-morning / Mid-afternoon Daylight</td>
		</tr>
		<tr>
			<td>D65</td>
			<td>95.047</td>
			<td>100</td>
			<td>108.883</td>
			<td>94.811</td>
			<td>100</td>
			<td>107.304</td>
			<td>Noon Daylight</td>
		</tr>
		<tr>
			<td>D75</td>
			<td>94.972</td>
			<td>100</td>
			<td>122.638</td>
			<td>94.416</td>
			<td>100</td>
			<td>120.641</td>
			<td>North sky Daylight</td>
		</tr>
		<tr>
			<td>E</td>
			<td>100</td>
			<td>100</td>
			<td>100</td>
			<td>100</td>
			<td>100</td>
			<td>100</td>
			<td>Equal energy</td>
		</tr>
		<tr>
			<td>F1</td>
			<td>94.8788</td>
			<td>100</td>
			<td>108.1515</td>
			<td>94.7913</td>
			<td>100</td>
			<td>103.1914</td>
			<td>Daylight Fluorescent</td>
		</tr>
		<tr>
			<td>F2</td>
			<td>99.186</td>
			<td>100</td>
			<td>67.393</td>
			<td>103.279</td>
			<td>100</td>
			<td>69.027</td>
			<td>Cool White Fluorescent</td>
		</tr>
		<tr>
			<td>F3</td>
			<td>103.7535</td>
			<td>100</td>
			<td>49.8605</td>
			<td>108.9683</td>
			<td>100</td>
			<td>51.9648</td>
			<td>White Fluorescent</td>
		</tr>
		<tr>
			<td>F4</td>
			<td>109.1473</td>
			<td>100</td>
			<td>38.8133</td>
			<td>114.9614</td>
			<td>100</td>
			<td>40.9633</td>
			<td>Warm White Fluorescent</td>
		</tr>
		<tr>
			<td>F5</td>
			<td>90.872</td>
			<td>100</td>
			<td>98.7229</td>
			<td>93.3686</td>
			<td>100</td>
			<td>98.6363</td>
			<td>Daylight Fluorescent</td>
		</tr>
		<tr>
			<td>F6</td>
			<td>97.3091</td>
			<td>100</td>
			<td>60.1905</td>
			<td>102.1481</td>
			<td>100</td>
			<td>62.0736</td>
			<td>Lite White Fluorescent</td>
		</tr>
		<tr>
			<td>F7</td>
			<td>95.041</td>
			<td>100</td>
			<td>108.747</td>
			<td>95.792</td>
			<td>100</td>
			<td>107.686</td>
			<td>D65 simulator, Daylight simulator</td>
		</tr>
		<tr>
			<td>F8</td>
			<td>96.4125</td>
			<td>100</td>
			<td>82.3331</td>
			<td>97.1146</td>
			<td>100</td>
			<td>81.1347</td>
			<td>D50 simulator, Sylvania F40 Design 50</td>
		</tr>
		<tr>
			<td>F9</td>
			<td>100.3648</td>
			<td>100</td>
			<td>67.8684</td>
			<td>102.1163</td>
			<td>100</td>
			<td>67.8256</td>
			<td>Cool White Deluxe Fluorescent</td>
		</tr>
		<tr>
			<td>F10</td>
			<td>96.1735</td>
			<td>100</td>
			<td>81.7123</td>
			<td>99.0012</td>
			<td>100</td>
			<td>83.134</td>
			<td>Philips TL85, Ultralume 50</td>
		</tr>
		<tr>
			<td>F11</td>
			<td>100.962</td>
			<td>100</td>
			<td>64.350</td>
			<td>103.863</td>
			<td>100</td>
			<td>65.607</td>
			<td>Philips TL84, Ultralume 40</td>
		</tr>
		<tr>
			<td>F12</td>
			<td>108.0463</td>
			<td>100</td>
			<td>39.2275</td>
			<td>111.4284</td>
			<td>100</td>
			<td>40.353</td>
			<td>Philips TL83, Ultralume 30</td>
		</tr>
	</tbody>
</table>

Syntax
------

```
var c = new Color('ciexyz(11.2933, 11.0002, 12.8373, D65)');

expect(c.format('cielch(uv)')).to.equal('cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)');
```

### CIEXYZ
```
ciexyz(x, luma|Y, z, illuminant?, observer?)

luma: from 0 to 100, up to 4 decimal places
x: from 0 to 127, up to 4 decimal places
y: from 0 to 127, up to 4 decimal places

ciexyz(11.2933, 11.0002, 12.8373)
ciexyz(11.2933, 11.0002, 12.8373, D65, 2)
```
```
ciexyza(x, luma|Y, z, alpha, illuminant?, observer?)

ciexyza(11.2933, 11.0002, 12.8373, 0.7)
ciexyza(11.2933, 11.0002, 12.8373, 0.7, D65, 2)
```

### CIEYxy
```
cieyxy(luma|Y, x, y, illuminant?, observer?)

luma: from 0 to 100, up to 4 decimal places
x: from 0 to 100, up to 4 decimal places
y: from 0 to 100, up to 4 decimal places

cieyxy(11.0002, 32.1464, 31.3121)
cieyxy(11.0002, 32.1464, 31.3121, D65, 2)
```
```
cieyxya(luma|Y, x, y, alpha, illuminant?, observer?)

cieyxya(11.0002, 32.1464, 31.3121, 0.7)
cieyxya(11.0002, 32.1464, 31.3121, 0.7, D65, 2)
```

### CIELab
```
cielab(luma, a, b, illuminant?, observer?)

luma: from 0 to 100, up to 4 decimal places
a: from -128 to 127, up to 4 decimal places
y: from -128 to 127, up to 4 decimal places

cielab(39.5808, 6.2364, -2.2407)
cielab(39.5808, 6.2364, -2.2407, D65, 2)
```
```
cielaba(luma, a, b, alpah, illuminant?, observer?)

cielaba(39.5808, 6.2364, -2.2407, 0.7)
cielaba(39.5808, 6.2364, -2.2407, 0.7, D65, 2)
```

### CIELuv
```
cieluv(luma, u, v, illuminant?, observer?)

luma: from 0 to 100, up to 4 decimal places
u: from -128 to 127, up to 4 decimal places
v: from -128 to 127, up to 4 decimal places

cieluv(39.5808, 6.4091, -3.8343)
cieluv(39.5808, 6.4091, -3.8343, D65, 2)
```
```
cieluva(luma, u, v, alpha, illuminant?, observer?)

cieluv(39.5808, 6.4091, -3.8343, 0.7)
cieluv(39.5808, 6.4091, -3.8343, 0.7, D65, 2)
```

### CIELCH(ab)
```
cielch(ab)(luma, chroma, hue, illuminant?, observer?)

luma: from 0 to 100, up to 4 decimal places
chroma: from 0 to 100, up to 4 decimal places
hue: from 0 to 359.9999, up to 4 decimal places

cielch(ab)(39.5808, 6.6267, 340.237)
cielch(ab)(39.5808, 6.6267, 340.237, D65, 2)
```
```
cielcha(ab)(luma, chroma, hue, alpha, illuminant?, observer?)

cielcha(ab)(39.5808, 6.6267, 340.237, 0.7)
cielcha(ab)(39.5808, 6.6267, 340.237, 0.7, D65, 2)
```

### CIELCH(uv)
```
cielch(uv)(luma, chroma, hue, illuminant?, observer?)

luma: from 0 to 100, up to 4 decimal places
chroma: from 0 to 100, up to 4 decimal places
hue: from 0 to 359.9999, up to 4 decimal places

cielch(uv)(39.5808, 7.4685, 329.1097)
cielch(uv)(39.5808, 7.4685, 329.1097, D65, 2)
```
```
cielcha(uv)(luma, chroma, hue, alpha, illuminant?, observer?)

cielcha(uv)(39.5808, 7.4685, 329.1097, 0.7)
cielcha(uv)(39.5808, 7.4685, 329.1097, 0.7, D65, 2)
```

License
-------

[MIT](http://www.opensource.org/licenses/mit-license.php) &copy; Baptiste Augrain