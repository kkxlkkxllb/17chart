ChartBase = require("controllers/chart4")
# 客户月消费能力分析
class Chart77 extends ChartBase
	opts:
		h_ser: ['5000以下','5001-10000','10001-30000','30001-50000','50001-100000','100000以上']
		h_label: '金额区间（元）'
		v_ser: [2332,754,754,167,112,65]
		v_label: '消费人数（人）'
		labelColor: '#5CB539'
		colors: ["#5CB539"]
module.exports = Chart77