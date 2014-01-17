ChartBase = require("controllers/chart5")
# 商户月刷卡量在商圈占比分析
class Chart76 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser1: [85711,78962,85877,80619,87117,79306]
		v_ser2: [2171,1852,2178,2028,1966,1700]
		v_label: '商户占比'
		line_label: "商户占比"
		line_color: "#ADCF32"
		c1_label: '商圈刷卡量（笔）'
		c2_label: '商户刷卡量（笔）'
		colors: ["#ADCF32","#7B7A7B"]
		type: 'logarithmic'
		custom: true
module.exports = Chart76
