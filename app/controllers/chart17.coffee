ChartBase = require("controllers/chart1")
class Chart17 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser: [{color: '#FF007A', y: 5412047}, {color:"#FF0000", y:7877659}, {color:"#FF0052", y: 11186082}]
		v_label: '消费金额(元)'
	getOptions: (data) ->
		data = $.extend {},@opts,data
		# convert
		if $.type(data.h_ser) is "string"
			data.h_ser = data.h_ser.split(";")
		if $.type(data.v_ser) is "string"
			data.v_ser = $.map data.v_ser.split(";"), (d,i) ->
				color: opt.v_ser[i].color # color can not been modified
				y: Number(d)
		params =
			credits:
				enabled: false
			chart:
				type: 'column'
			title:
				text: '--'
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
			yAxis:
				min: 0
				gridLineDashStyle: 'longdash'
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0

			plotOptions:
				series:
					pointWidth: 350
				column:
					# borderRadius: 10
					# arrowTop: true
					# pointPadding: -0.3
					# groupPadding: 0.2
					# borderWidth: 0
					borderWidth: 4
					dataLabels:
						enabled: true
						color: '#FFF'
						align: 'center'
						style:
							fontWeight:'bold'
							fontSize: '24px'
						# backgroundColor: '#FFF'
						y:40
			series: [
				data: data.v_ser
			]


module.exports = Chart17
