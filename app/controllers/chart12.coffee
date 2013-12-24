ChartBase = require("controllers/chart16")
# 新老客户对比分析
module.exports = class Chart12 extends ChartBase
	opts:
		month: ['8月','9月','10月']
		v_ser1: [15011,16021,17211]
		v_ser2: [106009,111068,115431]
		c1_label: '老客户人数（人）'
		c2_label: '新客户人数（人）'
		colors: ['#FDD000','#ADCF32']
