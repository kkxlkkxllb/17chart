ChartBase = require("controllers/chart4")
# 各消费金额区间的刷卡量分析
class Chart212 extends ChartBase
	opts:
		h_ser: ["11-13次","14-16次","17-19次","20-22次","23-25次","26次以上"]
		h_label: '刷卡次数'
		v_ser: [82,53,36,25,18,56]
		v_label: '刷卡量（万张）'
		colors: ["#9B1F23"]
		labelColor: '#9B1F23'

module.exports = Chart212