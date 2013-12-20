ChartBase = require("controllers/chart5")
# 新老客户的消费金额对比分析
module.exports = class Chart13 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser1: [15011,16021,17211]
		v_ser2: [106009,111068,115431]
		v_label: '消费金额（元）'
		c1_label: '新客户'
		c2_label: '老客户'
		colors: ['#FDD000','#ADCF32']
		type: 'logarithmic'
