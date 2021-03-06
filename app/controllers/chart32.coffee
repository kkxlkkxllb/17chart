ChartBase = require("controllers/chart5")
# 月均客单价对比分析
class Chart32 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser1: [962,978,1105]
		v_ser2: [1120,1146,1134]
		v_label: '每月客单价（元/笔）'
		c1_label: '新客户'
		c2_label: '老客户'
		colors: ["#FDD000","#ADCF32"]
		groupPadding: 0.23
		chartHeight: 600
		chartWidth: 800

module.exports = Chart32