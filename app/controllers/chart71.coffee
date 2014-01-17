ChartBase = require("controllers/chart38")
# 商圈内消费金额分析
class Chart71 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [6291,5984,5862,6362,8264,6762]
		v_label: '商圈消费金额（万元）'
		groupPadding: 0.1
		column_color: "#EA5514"
		char_color: "#EA5514"
module.exports = Chart71