ChartBase = require("controllers/chart1")
# 银行卡总量分析
class Chart3 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [391, 393, 411, 419, 428, 436]
		v_label: '银行卡总量（万张）'
	getOptions: (data) ->
		data = @formatData(data)
		params =
			chart:
				type: 'area'
			credits:
				enabled: false
			title:
				text: "--"
			tooltip:
				enabled: false
			legend:
				enabled: false
			xAxis:
				categories: data.h_ser
				# type: 'datetime'
				gridLineDashStyle: 'longdash'
				gridLineWidth: 1
				# startOnTick: true
				title:
					text: data.h_label
					align: "high"
				# dateTimeLabelFormats:
				# 	second: '%H:%M:%S'
				# 	minute: '%H:%M'
				# 	hour: '%H:%M'
				# 	day: '%e. %b'
				# 	week: '%e. %b'
				# 	month: '%b'
				# 	year: '%Y'
			yAxis:
				maxPadding: 0.25
				type: 'logarithmic'
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
				gridLineDashStyle: 'longdash'
			plotOptions:
				area:
					lineColor: "#fff"
					dataLabels:
						enabled: true
						color: 'red'
						y: -5
					marker:
						lineWidth: 2
						radius: 6
						fillColor: "red"
			series: [
				data: data.v_ser
			]

module.exports = Chart3