ChartBase = require("controllers/chart_base")
# 月刷卡金额对比分析
class Chart5 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser1: [107717,99909,87701,92349,143220,132540]
		v_ser2: [2269,2311,1927,2694,2873,3324]
		line_label: '行业占比'
		c1_label: '行业月均刷卡额（万元）'
		c2_label: '商户月刷卡额（万元）'
		colors: ["#7B7A7B","#EBAC28"]
		pointWidth: 40
		type: 'logarithmic'
		custom: true
	render: ->
		@html require("views/chart5")(@opts)
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
		data
	params: (data) ->
		data = @formatData(data)
		lineData = []
		for item,i in data.v_ser2
			lineData[i] = Math.round(item*2e7/data.v_ser1[i])
		# console.log lineData
		params =
			colors: data.colors
			credits:
				enabled: false
			chart:
				height: data.chartHeight || 600
				width: data.chartWidth || 1000
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
				itemStyle:
					fontSize: '14px'
					fontFamily: "Adobe Heiti Std"
				verticalAlign: 'top'
				y: 100
			xAxis:
				categories: data.h_ser
				lineColor: "#888"
				lineWidth: 2
				labels:
					y: 20
				title:
					text: data.h_label
					align: "high"
			yAxis: [
				labels:
					enabled: false
				opposite: true
				offset: 0
				#minPadding: data.line_minPadding || 5
				#maxPadding: data.line_maxPadding || 0.4
				minPadding: data.line_minPadding || 11
				maxPadding: data.line_maxPadding || 0.02
				gridLineWidth: 0
				title:
					enabled: false
			,
				gridLineDashStyle: 'longdash'
				type: data.type || null
				maxPadding: data.maxPadding || 0.8
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
			]
			plotOptions:
				line:
					dataLabels:
						enabled: true
						y: -15
						style:
							fontSize: '14px'
							fontFamily: "Adobe Heiti Std"
						# format: "{point.y:.2f}%"
						formatter: ->
							Math.round(this.y/2e3)/100 + "%"
				column:
					pointWidth: data.pointWidth || null
					groupPadding: data.groupPadding || 0.1
					dataLabels:
						enabled: true
						y: -15
						style:
							fontSize: '14px'
							fontFamily: "Adobe Heiti Std"
					#borderRadiusTopLeft: 30
					#borderRadiusTopRight: 30
					#borderRadius: 10
					#arrowTop: true
			series: [
				name: data.line_label
				color: data.line_color || "#EBAC28"
				data: lineData
				marker:
					lineWidth: 2
					fillColor: 'white'
					lineColor: data.line_color || "#EBAC28"
			,
				name: data.c1_label
				type: 'column'
				data: data.v_ser1
				yAxis: 1
			,
				name: data.c2_label
				type: 'column'
				data: data.v_ser2
				yAxis: 1
			]
	getOptions: (data) ->
		data = @formatData(data)
		params =
			colors: data.colors
			chart:
				type: 'column'
				marginTop: 40
				width: data.chartWidth || 1000
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
			yAxis: [
				labels:
					enabled: false
				opposite: true
				offset: 0
				# minPadding: data.line_minPadding || 11
				# maxPadding: data.line_maxPadding || 0.2
				gridLineWidth: 0
				title:
					enabled: false
			,
				gridLineDashStyle: 'longdash'
				type: data.type || null
				maxPadding: data.maxPadding || 0.2
				gridLineColor: "#ddd"
				lineColor: "#888"
				lineWidth: 2
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
			]
			plotOptions:
				column:
					pointWidth: data.pointWidth || null
					groupPadding: data.groupPadding || 0.2
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
				yAxis: 1
			,
				name: data.c2_label
				data: data.v_ser2
				yAxis: 1
			]
		if @opts.custom
			@params(data)
		else
			params
module.exports = Chart5