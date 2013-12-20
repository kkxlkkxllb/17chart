ChartBase = require("controllers/chart_base")
# 流失客户、老客户对比
module.exports = class Chart16 extends ChartBase
	opts:
		h_ser: ['8月','9月','10月']
		h_label: '月份'
		v_ser1: [15000,1000,17000]
		v_ser2: [106009,111068,115431]
		v_label: '客户人数（人）'
		c1_label: '流失客户'
		c2_label: '老客户'
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
		data.ar = []
		for d,i in data.v_ser1
			hash =
				type: "pie"
				name: data.h_ser[i]
				data: [
					[data.h_ser[i] + data.c1_label,data.v_ser1[i]]
					[data.h_ser[i] + data.c2_label,data.v_ser2[i]]
				]
				center: [(i + 1)*200, 80]
				size: 150
			data.ar.push hash
		data
	getOptions: (data) ->
		data = @formatData(data)
		params =
			colors: ['#EA5514','#ADCF32']
			# chart:
			# 	heigh: 800
			# 	width: 600
			# 	type: 'column'
			credits:
				enabled: false
			title:
				text: "-"
			tooltip:
				enabled: false
			legend:
				enabled: true
				layout: 'vertical'
				align: 'right'
				verticalAlign: 'middle'
				borderWidth: 0
				# align: 'right'
				# verticalAlign: 'top'
				# floating: true
				# x: -60
				# borderWidth: 0
			xAxis:
				categories: data.h_ser
				# lineColor: "#888"
				# lineWidth: 2
				# title:
				# 	text: data.h_label
				# 	align: "high"
				# labels:
				# 	y: 20
			# yAxis:
			# 	gridLineDashStyle: 'longdash'
			# 	type: 'logarithmic'
			# 	gridLineColor: "#ddd"
			# 	lineColor: "#888"
			# 	lineWidth: 2
			# 	title:
			# 		text: data.v_label
			# 		align: "high"
			# 		rotation: 0
			# 		y: -15
			# 		offset: 0
			plotOptions:
				pie:
					allowPointSelect: true
					cursor: 'pointer'
					# borderWidth: 2
					startAngle: 0
					dataLabels:
						softConnector: false
						enabled: true
						color: '#333'
						connectorColor: '#666'
						format: '<b>{point.name}</b>: {point.percentage:.1f} %'

			series: data.ar
