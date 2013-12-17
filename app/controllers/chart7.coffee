ChartBase = require("controllers/chart1")
# 月消费金额占比走势分析
class Chart7 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [2.10,2.30,2.20,2.90,2.00,2.50]
		v_label: '金额占比（%）'
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
				minorTickInterval: 0.2
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
						formatter: ->
							this.y + "%"
					marker:
						lineWidth: 2
						radius: 6
						fillColor: "red"
			series: [
				data: data.v_ser
			]

module.exports = Chart7