ChartBase = require("controllers/chart1")
# 流失客户在同行业其他商户的月消费频次分析
class Chart33 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser: [{color: '#EBAA00', y: 10310}, {color:"#EA5514", y:11916}, {color:"#E60012", y: 13788}]
		v_label: '刷卡量(笔)'
		type: 'logarithmic'
	getOptions: (data) ->
		data = $.extend {},@opts,data
		# convert
		if $.type(data.h_ser) is "string"
			data.h_ser = data.h_ser.split(";")
		if $.type(data.v_ser) is "string"
			data.v_ser = $.map data.v_ser.split(";"), (d,i) =>
				color: @opts.v_ser[i].color # color can not been modified
				y: Number(d)
		params =
			credits:
				enabled: false
			chart:
				heigh: 800
				width: 800
				type: 'column'
			title:
				text: ' '
			tooltip:
				enabled: false
			legend:
				enabled: false
			xAxis:
				categories: data.h_ser
				title:
					text: data.h_label
					align: "high"
					# offset: 0
				labels:
					y: 20
					style:
						fontSize: '20px'
			yAxis:
				# min: 0
				# gridLineDashStyle: 'longdash'
				minPadding: 0.2
				maxPadding: 0.2
				gridLineWidth: 0
				lineColor: "#888"
				lineWidth: 3
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: 5
					offset: 5
					enabled:true
				labels:
					enabled: false
				type: data.type || 'logarithmic'

			plotOptions:
				series:
					pointWidth: 220
				column:
					# borderRadius: 10
					# arrowTop: true
					# pointPadding: -0.3
					# groupPadding: 0.2
					# borderWidth: 0
					borderWidth: 4
					pointPadding: 0.2
					dataLabels:
						enabled: true
						color: '#FFF'
						align: 'center'
						style:
							fontWeight:'bold'
							fontSize: '22px'
						# backgroundColor: '#FFF'
						y:40
			series: [
				data: data.v_ser
			]


module.exports = Chart33
