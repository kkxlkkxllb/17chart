ChartBase = require("controllers/chart38")
# 各类目商品每日消费次数统计
class Chart82 extends ChartBase
	opts:
		h_ser: ['星期一','星期二','星期三','星期四','星期五','星期六','星期日']
		h_label: '天'
		v_ser: [27.8,23.9,39.1,37.6,25.8,11,26.7]
		v_label: '每日消费次数（笔）'
		groupPadding: 0.1
		column_color: "#75C5B5"
		char_color: "#717171"
module.exports = Chart82