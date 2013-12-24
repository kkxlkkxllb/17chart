ChartBase = require("controllers/chart1")
# 各消费金额区间的刷卡量分析
# bar chart children: [41,11,111,14,141]
class Chart4 extends ChartBase
	opts:
		h_ser: ["5以下", "5-10", "10-15", "15-20", "20-25", "25-30", "30-35", "35-40", "40-45", "45-50", "50以上"]
		h_label: '金额区间（万元）'
		v_ser: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6]
		v_label: '刷卡次数'
		labelColor: '#DE2A23'
		colors: ["#DE2A23","#9B1F23"]
	getOptions: (data) ->
		data = @formatData(data)
		len = data.h_ser.length - 1
		if data.colors.length > 1
			colors = []
			for i in [1..len]
				colors.push data.colors[0]
			colors.push data.colors[1]
		else
			colors = data.colors
		v =
			colors: colors
			chart:
				type: 'bar'
			credits:
				enabled: false
			title:
				text: " "
			tooltip:
				enabled: false
			legend:
				enabled: false
			plotOptions:
				bar:
					colorByPoint: true
					dataLabels:
						enabled: true
						color: data.labelColor
						x: 15
						y: -2
						style:
							fontSize: '16px'
			xAxis:
				categories: data.h_ser
				lineColor: "#888"
				lineWidth: 2
				tickWidth: 0
				title:
					text: data.h_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
			yAxis:
				max: data.max || null
				maxPadding: 0.25
				gridLineWidth: 0
				title:
					text: data.v_label
					align: "middle"
					offset: 15
				labels:
					enabled: false
				opposite: true
			series: [
				data: data.v_ser
			]
module.exports = Chart4