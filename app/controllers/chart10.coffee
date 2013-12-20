ChartBase = require("controllers/chart2")
# 卡所属银行分析
class Chart10 extends ChartBase
	opts:
		category: ["广东发展银行","成都农信社","其他","兴业银行","中国农业银行","成都市商业银行","中国民生银行","交通银行","中国银行","中国工商银行","招商银行"]
		percent: [0.56,1.16,1.60,2.37,5.15,7.62,8.75,9.38,10.26,23.97,29.19]
		colors: ["#00A9DF","#006383","#004662","#666464"]

module.exports = Chart10