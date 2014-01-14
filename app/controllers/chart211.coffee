ChartBase = require("controllers/chart1")
# 各消费金额区间的刷卡量分析
# bar chart children: [41,11,111,14,141]
class Chart211 extends ChartBase
	opts:
		h_ser: ["1次","2次","3次","4次","5次","6次","7次","8次","9次","10次","10次以上"]
		h_label: '刷卡次数'
		v_ser: [735,380,227,156,113,86,67,55,45,38,270]
		v_label: '刷卡量（万张）'
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
							fontSize: '14px'
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
module.exports = Chart211