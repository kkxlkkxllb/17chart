ChartBase = require("controllers/chart8")
# 每周交易额分析
class Chart43 extends ChartBase
	opts:
		h_ser: ['星期一','星期二','星期三','星期四','星期五','星期六','星期日']
		h_label: '天'
		v_ser: [633.9,661.9,640.9,604.9,711,616.3,632.1]
		v_label: '日均客单价（元/人）'
		color: "#036EB8"

module.exports = Chart43
