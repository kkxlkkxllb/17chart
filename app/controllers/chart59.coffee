ChartBase = require("controllers/chart5")
# 月均客单价对比分析
class Chart59 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser1: [1774.3,2535.8,2204.9]
		v_ser2: [1741.3,1728.8,736.3]
		v_label: '消费金额（元/人）'
		c1_label: '沉默客户'
		c2_label: '老客户'
		colors: ["#EA5514","#ADCF32"]
		groupPadding: 0.23
		chartHeight : 600
		chartWidth : 700

module.exports = Chart59