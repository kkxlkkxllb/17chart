ChartBase = require("controllers/chart38")
# 各类目商品每日客单价统计
class Chart83 extends ChartBase
	opts:
		h_ser: ['星期一','星期二','星期三','星期四','星期五','星期六','星期日']
		h_label: '天'
		v_ser: [3104,2936,2915,3166,3186,2658,2838]
		v_label: '每日消费次数（天/笔）'
		groupPadding: 0.1
		column_color: "#DAE000"
		char_color: "#717171"
module.exports = Chart83