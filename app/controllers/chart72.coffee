ChartBase = require("controllers/chart24")
# 月刷卡金额对比分析
class Chart72 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser1: [450657,394980,397065,401415,450122,448685]
		v_ser2: [6291,5984,5862,6362,8264,6762]
		line_label: "商圈占比"
		c1_label: '同行业刷卡额（万元）'
		c2_label: '商圈内刷卡额（万元）'
		line_color: "#EA5514"
		colors: ["#7B7A7B","#EA5514"]
		type: 'logarithmic'
		custom: true
module.exports = Chart72