ChartBase = require("controllers/chart5")
# 月均客单价对比分析
class Chart53 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser1: [1741.3,1728.8,1736.3]
		v_ser2: [1891.6,2148.1,1925.4]
		v_label: '每月客单价（元/笔）'
		c1_label: '沉默客户'
		c2_label: '老客户'
		colors: ["#507205","#ADCF32"]
		groupPadding: 0.23
		chartHeight : 600
		chartWidth : 700

module.exports = Chart53