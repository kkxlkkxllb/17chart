ChartBase = require("controllers/chart3")
# 各时点交易金额分析
class Chart80 extends ChartBase
	opts:
		h_ser: [10,11,12,13,14,15,16,17,18,19,20,21,22]
		h_label: '时间点'
		v_ser: [32.28,26.45,29.64,27.55,46.35,53.94,63.37,54.01,37.08,35.57,39.56,32.84,0.86]
		v_label: '消费金额（万元）'
		color: '#920783'
		fillColor: "#CCB3D5"
		percent: false
		width:800
		radius:5

module.exports = Chart80