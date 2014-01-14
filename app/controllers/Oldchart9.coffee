ChartBase = require("controllers/chart8")
# 每周交易额分析
class Chart9 extends ChartBase
	opts:
		h_ser: ['9/30-10/6','10/7-10/13','10/14-10/20','10/21-10/27']
		h_label: '周'
		v_ser: [1226.9,426.4,524,1070.1]
		v_label: '交易金额（万元）'
		color: "#006383"

module.exports = Chart9
