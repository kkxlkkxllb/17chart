ChartBase = require("controllers/chart1")
# 各消费金额区间的刷卡量分析
class Chart4 extends ChartBase
	opts:
		h_ser: ["5以下", "5-10", "10-15", "15-20", "20-25", "25-30", "30-35", "35-40", "40-45", "45-50", "50以上"]
		h_label: '金额区间（万元）'
		v_ser: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6]
		v_label: '刷卡次数'
	getOptions: (data) ->
		data = @formatData(data)
		params =
			chart:
				type: 'bar'
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
				# startOnTick: true
				title:
					text: data.h_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
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
				title:
					text: data.v_label
					align: "high"

			plotOptions:
				bar:
					color: "red"
					dataLabels:
						enabled: true
						color: 'red'
			series: [
				data: data.v_ser
			]

module.exports = Chart4