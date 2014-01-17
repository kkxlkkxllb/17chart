ChartBase = require("controllers/chart16")
# 新老客户的消费金额对比分析
module.exports = class Chart13 extends ChartBase
	opts:
		month: ['8月','9月','10月']
		v_ser1: [15011,16021,17211]
		v_ser2: [106009,111068,115431]
		c1_label: '新客户消费金额（万元）'
		c2_label: '老客户消费金额（万元）'
		colors: ['#E0742D','#ADCF32']