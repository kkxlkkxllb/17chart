ChartBase = require("controllers/chart4")
# 老客户的购买频次分析
module.exports = class Chart141 extends ChartBase
	opts:
		h_ser: ["11-13次","14-16次","17-19次","20-22次","23-25次","26次以上"]
		h_label: '消费次数'
		v_ser: [98,34,15,12,9,7]
		v_label: '消费人数'
		colors: ["#EA5514"]
		labelColor: '#EA5514'
