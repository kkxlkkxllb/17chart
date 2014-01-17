# 各类目消费性别分析
module.exports = class Chart84 extends Spine.Controller
	className: "container"
	events:
		"submit form": "submit"
		"click .export": "export"
	opts:
		h_ser: ["个性写真","休闲娱乐","儿童","其他","化妆品","家居","数码家电","服饰鞋包","电子数码","眼镜","美容美发","药店","超市","车品","运动户外","钟表珠宝","食品烟酒","餐饮酒吧"]
		v_ser1: [16.16,26.70,11.74,12.70,4.42,12.50,63.69,10.79,8.97,17.05,12.27,12.75,24.39,85.74,12.12,28.43,31.50,19.94]
		v_ser2: [83.84,73.30,88.26,87.30,85.58,87.50,36.31,89.21,91.03,82.95,87.73,87.25,75.67,14.26,87.88,71.57,68.50,80.06]
		#v_label1: '卡楚拉尼斯卡拉贡内斯'
		#v_label2: '伊奥加托斯塞塔利迪斯'
		v_label1: '男性'
		v_label2: '女性'
		colors: ["#00A0E9","#ADCF32"]
	constructor: ->
		super
		$("article").html @render()
		@initChart()
	initChart: (data) ->
		data = $.extend {},@opts,data
		$('#chart1').highcharts @getOptions1(data)
		$('#chart2').highcharts @getOptions2(data)
	export: ->
		chart1 = $('#chart1').highcharts()
		chart2 = $('#chart2').highcharts()
		options =
			url: "http://192.168.88.110:8080/export/"
		Highcharts.exportCharts([chart1,chart2],options)
	render: ->
		@html require("views/chart84")(@opts)
	submit: (e) ->
		e.preventDefault()
		$form = $(e.currentTarget)
		obj = $form.serializeArray()
		serializedData = {}
		$.each obj, (index, field)->
			serializedData[field.name] = field.value
		@initChart(serializedData)
	formatData1: (data) ->
		if $.type(data.v_ser1) is "string"
			str = data.v_ser1.replace(/%/g,'')
			data.v_ser1 = $.map str.split(";"), (d) ->
				Number(d)
		for item, i in data.v_ser1
			data.v_ser1[i] = -item
			console.log data.v_ser1[i]
		# console.log "formatData1:" + data.v_ser1
		data
	formatData2: (data) ->
		if $.type(data.h_ser) is "string"
			data.h_ser = data.h_ser.split(";")
		if $.type(data.v_ser2) is "string"
			str = data.v_ser2.replace(/%/g,'')
			data.v_ser2 = $.map str.split(";"), (d) ->
				Number(d)
		# console.log "formatData2:" + data.v_ser2
		data
	getOptions1: (data) ->
		data = @formatData1(data)
		params =
			colors: ['#00A0E9']
			chart:
				width: 400
				type: 'bar'
				marginTop: 36
			credits:
				enabled: false
			exporting:
				enabled: false
			title:
				text: " "
			tooltip:
				enabled: false
			legend:
				enabled: false
			xAxis:
				gridLineWidth: 0
				lineWidth: 0
				tickWidth: 0
				reversed: false
				pointWidth:'20px'
				labels:
					enabled: false
				title:
					enabled: true
					text: data.v_label1
					align: "high"
					rotation: 0
					offset: 0
					x: 356
					y: -12
			yAxis:
				gridLineWidth: 0
				minPadding: 0.02
				maxPadding: 0.25
				pointWidth:'20px'
				lineWidth: 0
				labels:
					enabled: false
				title:
					enabled: false
					text: data.v_label1
					align: "high"
					rotation: 0
					offset: 0
			series: [
				data: data.v_ser1
			]
			plotOptions:
				bar:
					dataLabels:
						enabled: true
						formatter: ->
							-this.y + '%'
	getOptions2: (data) ->
		data = @formatData2(data)
		params =
			colors: ['#ADCF32']
			chart:
				width: 400
				type: 'bar'
				marginLeft: 58
				marginBottom: 17
			exporting:
				enabled: false
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
				gridLineWidth: 0
				lineColor: "#888"
				lineWidth: 0
				tickWidth: 0
				pointWidth:'20px'
				title:
					text: data.h_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
					enabled: false
				labels:
					x: -32
					align:'center'
			yAxis:
				gridLineWidth: 0
				maxPadding: 0.25
				lineWidth: 0
				pointWidth:'20px'
				title:
					text: data.v_label2
					align: "low"
					offset: 15
				labels:
					enabled: false
				opposite: true
			series: [
				data: data.v_ser2
			]
			plotOptions:
				bar:
					dataLabels:
						enabled: true
						format: '{y}%'