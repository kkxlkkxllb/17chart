ChartBase = require("controllers/chart38")
# 各类目商品每日消费金额统计
class Chart81 extends ChartBase
	opts:
		h_ser: ['星期一','星期二','星期三','星期四','星期五','星期六','星期日']
		h_label: '天'
		v_ser: [86144,70143,1113944,118913,82212,29237,75687]
		v_label: '每日消费金额（元）'
		groupPadding: 0.1
		column_color: "#7ECEF4"
		char_color: "#717171"
module.exports = Chart81