ChartBase = require("controllers/chart1")
# 月均客单价波动分析
class Chart46 extends ChartBase
	opts:
		h_ser: ['一季度','二季度','三季度','四季度']
		h_label: '季度'
		v_ser: [717.7,636.7,630.3,757.8]
		v_label: '客单价（元/笔）'
		color: "#2EA7E0"
	getOptions: (data) ->
		data = @formatData(data)
		params =
			credits:
				enabled: false
			chart:
				marginTop: 40
				# width: 800
			title:
				text: " "
			tooltip:
				enabled: false
			legend:
				enabled: false
			xAxis:
				categories: data.h_ser
				tickmarkPlacement: "on"
				gridLineDashStyle: 'longdash'
				gridLineWidth: 1
				gridLineColor: "#ddd"
				lineColor: "#888"
				lineWidth: 2
				title:
					text: data.h_label
					align: "high"
				labels:
					y: 20
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
				# minorTickInterval: 5
				# type: 'logarithmic'
				gridLineDashStyle: 'longdash'
				gridLineColor: "#ddd"
				lineColor: "#888"
				lineWidth: 2
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0

			plotOptions:
				line:
					lineColor: data.color
					dataLabels:
						enabled: true
						y: -15
						color: data.color
						style:
							fontSize: '14px'
					marker:
						lineWidth: 2
						radius: 6
						fillColor: "#fff"
						lineColor: data.color
			series: [
				data: data.v_ser
			]

module.exports = Chart46