ChartBase = require("controllers/chart5")
# 月均客单价对比分析
class Chart63 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser1: [1983,2010,2302]
		v_ser2: [11869,12727,13095]
		v_label: '消费金额（万元）'
		c1_label: '新客户'
		c2_label: '老客户'
		colors: ["#FDD000","#ADCF32"]
		# pointWidth: 40
		groupPadding: 0.3

module.exports = Chart63