ChartBase = require("controllers/chart_base")
# 月刷卡金额对比分析
class Chart26 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [33130, 31380, 39820, 38960, 39350, 42780, 42750]
		v_label: '月刷卡量（万元）'
		line_label: '月增长率'
		colors: ["#33a3dc"]
		type: 'logarithmic'
		custom: true
	render: ->
		@html require("views/chart25")(@opts)
	formatData: (data) ->
		data = $.extend {},@opts,data
		# console.log 'test:' + data.v_ser
		# convert
		if $.type(data.h_ser) is "string"
			str = data.h_ser.replace(/；/g,';')
			data.h_ser = str.split(";")
		if $.type(data.v_ser) is "string"
			str = data.v_ser.replace(/；/g,';')
			data.v_ser = $.map str.split(";"),(d) ->
				Number(d)
		# console.log 'hehe:' + data.h_ser
		# console.log 'hehe:' + data.v_ser
		data
	params: (data) ->
		data = @formatData(data)
		lineData = []
		for item,i in data.v_ser
			# console.log Math.round((data.v_ser[i+1]-item)*1000/item) if i < data.v_ser.length-1
			lineData[i] =  Math.round((data.v_ser[i+1]-item)*1000/item)/100 if i < data.v_ser.length-1
		params =
			colors: data.colors
			credits:
				enabled: false
			chart:
				type: 'column'
				height: 600
				width: 1000
			title:
				text: " "
			tooltip:
				enabled: false
			legend:
				enabled: true
				itemMarginTop: 30
				borderWidth: 0
				layout:'vertical'
				align: 'right'
				verticalAlign: 'top'
				y: 100
			xAxis:
				labels:
					enabled: false
				categories: data.h_ser
				lineColor: "#888"
				lineWidth: 2
				labels:
					y: 20
				title:
					text: data.h_label
					align: "high"
			yAxis:  [
				labels:
					enabled: false
				title:
					enabled: false
				opposite: true
				offset: 0
				minPadding: data.line_minPadding || 5
				maxPadding: data.line_maxPadding || 0.4
				gridLineWidth: 0
			,
				gridLineDashStyle: 'longdash'
				#type: data.type || null
				maxPadding: data.column_maxPadding || 0.8
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
						y: -20
						color: '#006383'
						style:
							fontSize: '14px'
						formatter: ->
							#Math.round(this.y) + '%'
							Math.round(this.y*100)/10 + '%'
				column:
					dataLabels:
						enabled: true
						y: -15
						color: '#33a3dc'
						style:
							fontSize: '14px'
					borderRadiusTopLeft: 30
					borderRadiusTopRight: 30
					borderRadius: 10
					pointPadding: 0.2
					arrowTop: true
			series: [
				name: data.line_label
				color: "#006383"
				type: 'line'
				data: lineData
				zIndex: 2
				marker:
					radius: 6
					lineWidth: 2
					lineColor: '#006383'
					fillColor: 'white'
			,
				name: data.v_label
				type: 'column'
				data: data.v_ser[1..data.v_ser.length]
				yAxis: 1
				zIndex: 1
			]
	getOptions: (data) ->
		data = @formatData(data)
		params =
			colors: data.colors
			chart:
				height: 600
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
			xAxis:
				labels:
					enabled: false
				categories: data.h_ser
				lineColor: "#888"
				lineWidth: 2
				title:
					text: data.h_label
					align: "high"
			yAxis:  [
				labels:
					enables: false
				title:
					text: '月增长率'
					style:
						color: '#006383'
				opposite: true
				offset: 0
			,
				gridLineDashStyle: 'longdash'
				#type: data.type || null
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
					enables: false
			]
			plotOptions:
				line:
					dataLabels:
						enabled: true
						#borderRadius: 5
						color: 'red'
						y: -15
						style:
							fontSize: '14px'
						formatter: ->
							Math.round(this.y)/10 + '%'
				column:
					dataLabels:
						enabled: true
						y: -15
						style:
							fontSize: '14px'
					borderRadiusTopLeft: 30
					borderRadiusTopRight: 30
					borderRadius: 10
					pointPadding: 0.2
					#arrowTop: true
			series: [
				#name: data.v1_label
				type: 'column'
				data: data.v_ser[1..data.v_ser.length]
				yAxis: 1
			]
		if @opts.custom
			@params(data)
		else
			params
module.exports = Chart26
