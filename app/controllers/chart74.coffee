ChartBase = require("controllers/chart38")
# 消费人数分析
class Chart74 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [1704,1503,1687,1605,1458,1311]
		v_label: '消费人数（人）'
		groupPadding: 0.1
		column_color: "#ADCF32"
		char_color: "#ADCF32"
module.exports = Chart74