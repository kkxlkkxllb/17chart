ChartBase = require("controllers/chart8")
# 每周交易额分析
class Chart28 extends ChartBase
	opts:
		h_ser: ['9/30-10/6','10/7-10/13','10/14-10/20','10/21-10/27']
		h_label: '周'
		v_ser: [776,685,675,929]
		v_label: '客单价（元/笔）'
		color: "#006383"

module.exports = Chart28