ChartBase = require("controllers/chart4")
# 客户消费能力分析
class Chart11 extends ChartBase
	opts:
		h_ser: ["1000以下","1000-2000","2001-3000","3001-4000","4001-5000","5001-6000","6001-7000","7001-8000","8001-9000","9001-10000","10001以上"]
		h_label: '消费区间（元）'
		v_ser: [72962,24966,12031,6776,4196,2916,1978,1470,1091,880,6995]
		v_label: '消费人数'
		colors: ["#5CB539","#507205"]
		labelColor: '#5CB539'

module.exports = Chart11