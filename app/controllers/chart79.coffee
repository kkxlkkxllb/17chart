ChartBase = require("controllers/chart42")
# 客户在其他地区同行业消费分析
class Chart79 extends ChartBase
	opts:
		h_ser: ['上海','太原','深圳','天津','成都','杭州','沈阳','大连','长春','哈尔滨','其他']
		h_label: '城市'
		v_ser: [59.75,47.35,46.92,44.42,36.51,35.82,30.36,29.63,26.40;22.86;272.33]
		v_label: '消费金额（万元）'
		groupPadding: 0.1
		colors: ["#EA5514"]
module.exports = Chart79