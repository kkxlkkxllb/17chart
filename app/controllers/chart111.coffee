ChartBase = require("controllers/chart4")
# 客户消费能力分析
class Chart111 extends ChartBase
	opts:
		h_ser: ["10001-12000","12001-14000","14001-16000","16001-18000","18001-20000","20001-22000","22001-24000","24001-26000","27001-28000","28001-30000","30001以上"]
		h_label: '消费区间（元）'
		v_ser: [1331,880,601,570,381,327,264,265,186,187,2003]
		v_label: '消费人数'
		colors: ["#507205"]
		labelColor: "#507205"

module.exports = Chart111