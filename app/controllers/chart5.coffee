ChartBase = require("controllers/chart_base")
# 月刷卡金额对比分析
class Chart5 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser1: [107717,99909,87701,92349,143220,132540]
		v_ser2: [2269,2311,1927,2694,2873,3324]
		v_label: '每月交易额（万元）'
		c1_label: '行业月均刷卡额'
		c2_label: '商户月刷卡额'
		colors: ["#7B7A7B","#EBAC28"]
		type: 'logarithmic'
	render: ->
		@html require("views/chart5")(@opts)
	formatData: (data) ->
		data = $.extend {},@opts,data
		# convert
		if $.type(data.h_ser) is "string"
			data.h_ser = data.h_ser.split(";")
		if $.type(data.v_ser1) is "string"
			data.v_ser1 = $.map data.v_ser1.split(";"),(d) ->
				Number(d)
		if $.type(data.v_ser2) is "string"
			data.v_ser2 = $.map data.v_ser2.split(";"),(d) ->
				Number(d)
		data
	getOptions: (data) ->
		data = @formatData(data)
		params =
			colors: data.colors
			chart:
				type: 'column'
				# heigh: 800
				# width: 600
			credits:
				enabled: false
			title:
				text: "--"
			tooltip:
				enabled: false
			legend:
				enabled: true
				# align: 'right'
				# verticalAlign: 'top'
				# floating: true
				# x: -60
				borderWidth: 0
				layout:'vertical'
				align: 'right'
				verticalAlign: 'middle'
			xAxis:
				categories: data.h_ser
				lineColor: "#888"
				lineWidth: 2
				labels:
					y: 20
				title:
					text: data.h_label
					align: "high"
			yAxis:
				gridLineDashStyle: 'longdash'
				type: data.type || null
				maxPadding: 0.1
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
				column:
					dataLabels:
						enabled: true
						y: -15
						fontWeight:'bold'
						fontSize: '16px'
					pointPadding: 0
					#borderRadiusTopLeft: 30
					#borderRadiusTopRight: 30
					#borderRadius: 10
					#arrowTop: true
			series: [
				name: data.c1_label
				data: data.v_ser1
			,
				name: data.c2_label
				data: data.v_ser2
			]

module.exports = Chart5