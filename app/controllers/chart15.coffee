ChartBase = require("controllers/chart16")
# 沉默、老客户对比分析
module.exports = class Chart15 extends ChartBase
	opts:
		month: ['8月','9月','10月']
		v_ser1: [15011,16021,17211]
		v_ser2: [106009,111068,115431]
		c1_label: '沉默客户（人）'
		c2_label: '老客户（人）'
		colors: ['#507205','#ADCF32']
