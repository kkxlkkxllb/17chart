ChartBase = require("controllers/chart4")
# 老客户的购买频次分析
module.exports = class Chart14 extends ChartBase
	opts:
		h_ser: ["1次", "2次", "3次", "4次", "5次", "6次", "7次", "8次", "9次", "10次", "10次以上"]
		h_label: '消费次数'
		v_ser: [34473,36843,68153,3962,1543,695,378,186,108,63,175]
		v_label: '消费人数'
		max: 6000
		labelColor: '#EA5514'
		colors: ["#FF9016","#FF9016","#FF9016","#FF9016","#FF9016","#FF9016","#FF9016","#FF9016","#FF9016","#FF9016","#EA5514"]
