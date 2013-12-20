ChartBase = require("controllers/chart4")
# 各消费金额区间的刷卡量分析
class Chart41 extends ChartBase
	opts:
		h_ser: ["50-70","70-90","90-110","110-130","130-150","150-170","170-190","190-210","210-230","230-250","250以上"]
		h_label: '金额区间（万元）'
		v_ser: [20615,9995,10075,3040,2285,1366,968,2163,583,498,5433]
		v_label: '刷卡次数'
		colors: ["#9B1F23"]
		labelColor: '#9B1F23'

module.exports = Chart41