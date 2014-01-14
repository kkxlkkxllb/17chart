ChartBase = require("controllers/chart4")
# 客户消费能力分析
class Chart49 extends ChartBase
	opts:
		h_ser: ["1次","2次","3次","4次","5次","6次","7次","8次","9次","10次","10次以上"]
		h_label: '消费次数'
		v_ser: [11840,19564,9037,4837,1205,2616,450,583,481,223,525]
		v_label: '消费人数'
		colors: ["#5CB539","#507205"]
		labelColor: '#5CB539'

module.exports = Chart49