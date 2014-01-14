ChartBase = require("controllers/chart4")
# 老客户的购买频次分析
module.exports = class Chart55 extends ChartBase
	opts:
		h_ser: ["1次", "2次", "3次", "4次", "5次", "6次", "7次", "8次", "9次", "10次", "10次以上"]
		h_label: '消费次数'
		v_ser: [37861,8422,2145,666,202,69,26,11,6,1,10]
		v_label: '消费人数'
		# max: 6000
		labelColor: '#ADCF32'
		colors: ["#ADCF32"]
