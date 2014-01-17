ChartBase = require("controllers/chart5")
# 月刷卡金额对比分析
class Chart69 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser1: [1799,1956,1812.5,1946.7,2273.9,2085.5]
		v_ser2: [45,39.5,39.7,40.1,45,44.8]
		v_label: '消费金额（亿元）'
		c1_label: '全城消费金额（亿元）'
		c2_label: '行业消费金额（亿元）'
		colors: ["#7B7A7B","#DE2A23"]
		groupPadding: 0.1
		type: 'logarithmic'
module.exports = Chart69