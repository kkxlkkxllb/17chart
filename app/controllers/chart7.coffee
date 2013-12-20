ChartBase = require("controllers/chart3")
# 月消费金额占比走势分析
class Chart7 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [2.10,2.30,2.20,2.90,2.00,2.50]
		v_label: '金额占比（%）'
		color: '#E0742D'
		fillColor: "#EBAC28"
		percent: true

module.exports = Chart7