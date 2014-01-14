ChartBase = require("controllers/chart4")
# 客户消费能力分析
class Chart50 extends ChartBase
	opts:
		h_ser: ["11-13次","14-16次","17-19次","20-22次","23-25次","25次以上"]
		h_label: '消费次数'
		v_ser: [514,205,56,25,15,33]
		v_label: '消费人数'
		colors: ["#507205"]
		labelColor: "#507205"

module.exports = Chart50