ChartBase = require("controllers/chart16")
# 新老客户的消费金额对比分析
module.exports = class Chart64 extends ChartBase
	opts:
		month: ['8月','9月','10月']
		v_ser1: [27007,27474,28458]
		v_ser2: [194936,205199,211345]
		c1_label: '新客户消费金额（笔）'
		c2_label: '老客户消费金额（笔）'
		colors: ['#FDD000','#ADCF32']
