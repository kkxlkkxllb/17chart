ChartBase = require("controllers/chart5")
# 沉默、老客户对比分析
module.exports = class Chart15 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser1: [15011,16021,17211]
		v_ser2: [106009,111068,115431]
		v_label: '客户人数（人）'
		c1_label: '沉默客户'
		c2_label: '老客户'
		colors: ['#507205','#ADCF32']
		type: 'logarithmic'
