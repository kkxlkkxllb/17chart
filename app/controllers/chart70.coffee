ChartBase = require("controllers/chart4")
# 商圈内月刷卡频次按不同区间分布
class Chart70 extends ChartBase
	opts:
		h_ser: ['1次','2次','3次','4次','5次','6次','7次','8次','9次','10次','10次以上']
		h_label: '消费次数'
		v_ser: [40405,10154,3114,1116,426,176,92,51,19,1417]
		v_label: '消费人数（人）'
		labelColor: '#EA5514'
		colors: ["#EA5514"]
module.exports = Chart70