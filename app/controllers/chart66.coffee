ChartBase = require("controllers/chart_base")
# 月刷卡金额对比分析
class Chart66 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser1: [0.414,0.423,0.388,0.414,0.432,0.448]
		v_ser2: [0.906;0.909;0.868;0.866;0.968;0.939]
		v_ser3: [3.501;3.480;3.573;3.574;3.598;3.525]
		v_label: '人均月消费笔数（笔/人）'
		c1_label: '目标商户'
		c2_label: '沉默商户'
		c3_label: '所有商户'
		colors: ["#5CB539","#507205","#ADCF32"]
		type: 'logarithmic'
		custom: true
	render: ->
		@html require("views/chart65")(@opts)
	formatData: (data) ->
		data = $.extend {},@opts,data
		# convert
		if $.type(data.h_ser) is "string"
			str = data.h_ser.replace(/；/g,';')
			data.h_ser = str.split(";")
		if $.type(data.v_ser1) is "string"
			data.v_ser1 = $.map data.v_ser1.split(";"),(d) ->
				Number(d)
		if $.type(data.v_ser2) is "string"
			data.v_ser2 = $.map data.v_ser2.split(";"),(d) ->
				Number(d)
		if $.type(data.v_ser3) is "string"
			data.v_ser3 = $.map data.v_ser3.split(";"),(d) ->
				Number(d)
		data
	params: (data) ->
		data = @formatData(data)
		# lineData = []
		# for item,i in data.v_ser2
		#	lineData[i] = Math.round(item*2e7/data.v_ser1[i])
		# console.log lineData
		params =
			colors: data.colors
			credits:
				enabled: false
			chart:
				height: 550
				width: 1200
				marginTop: 50
			title:
				text: " "
			tooltip:
				enabled: false
			legend:
				enabled: true
				# align: 'right'
				# verticalAlign: 'top'
				# floating: true
				# x: -60
				itemMarginTop: 30
				borderWidth: 0
				layout:'vertical'
				align: 'right'
				verticalAlign: 'top'
				y: 100
				itemStyle:
					fontSize: '14px'
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
				maxPadding: 0.2
				gridLineColor: "#ddd"
				lineColor: "#888"
				lineWidth: 2
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
				labels:
					enabled: false
			plotOptions:
				# line:
				# 	dataLabels:
				# 		enabled: true
				# 		y: -15
				# 		style:
				# 			fontSize: '14px'
				# 		formatter: ->
				# 			Math.round(this.y/2e4)/10 + "%"
				column:
					groupPadding: 0.2
					dataLabels:
						enabled: true
						y: -15
						style:
							fontSize: '14px'
					#borderRadiusTopLeft: 30
					#borderRadiusTopRight: 30
					#borderRadius: 10
					#arrowTop: true
			series: [
				# name: "行业占比"
				# color: "#EBAC28"
				# data: lineData
				# marker:
				# 	lineWidth: 2
				# 	fillColor: 'white'
				# 	lineColor: "#EBAC28"
				# ,
				name: data.c1_label
				type: 'column'
				data: data.v_ser1
			,
				name: data.c2_label
				type: 'column'
				data: data.v_ser2
			,
				name: data.c3_label
				type: 'column'
				data: data.v_ser3
			]
	getOptions: (data) ->
		data = @formatData(data)
		params =
			colors: data.colors
			chart:
				type: 'column'
				marginTop: 40
				width: 1000
			credits:
				enabled: false
			title:
				text: " "
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
				itemStyle:
					fontSize: '14px'
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
				maxPadding: 0.2
				gridLineColor: "#ddd"
				lineColor: "#888"
				lineWidth: 1.5
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
			plotOptions:
				column:
					pointWidth: data.pointWidth || null
					groupPadding: data.groupPadding || "0.4"
					dataLabels:
						enabled: true
						y: -15
						style:
							fontSize: '12px'
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
			,
				name: data.c3_label
				data: data.v_ser3
			]
		if @opts.custom
			@params(data)
		else
			params
module.exports = Chart66