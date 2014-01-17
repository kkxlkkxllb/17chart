ChartBase = require("controllers/chart1")
# 银行卡总量分析
class Chart3 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [391, 393, 411, 419, 428, 436]
		v_label: '银行卡总量（万张）'
		color: '#DE2A23'
		fillColor: "#FDD000"
	getOptions: (data) ->
		data = @formatData(data)
		dmin = Math.min data.v_ser...
		dmax = Math.max data.v_ser...
		ra = (dmax - dmin)/4
		min = Math.max [dmin - ra, 0]...
		max= dmax + ra
		params =
			chart:
				type: 'area'
				marginTop: 40
				width: data.width || null
			credits:
				enabled: false
			title:
				text: " "
			tooltip:
				enabled: false
			legend:
				enabled: false
			xAxis:
				categories: data.h_ser
				tickmarkPlacement: "on"
				lineColor: "#888"
				lineWidth: 2
				gridLineDashStyle: 'longdash'
				gridLineColor: "#ddd"
				gridLineWidth: 1
				labels:
					y: 20
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
				minorTickInterval: data.tick || null
				type: data.type || null
				min: min
				max: max
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
				area:
					lineColor: "#fff"
					fillColor: data.fillColor
					dataLabels:
						enabled: true
						# color: data.color
						y: -15
						formatter: ->
							if data.percent
								this.y + "%"
							else
								this.y
						style:
							fontSize: '13px'
					marker:
						lineWidth: 2
						radius: data.radius || 8
						fillColor: data.color
			series: [
				data: data.v_ser
			]

module.exports = Chart3