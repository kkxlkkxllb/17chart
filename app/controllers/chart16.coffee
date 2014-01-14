# 流失客户、老客户对比
module.exports = class Chart16 extends Spine.Controller
	className: "container"
	events:
		"submit form": "submit"
		"click .export": "export"
	opts:
		month: ['8月','9月','10月']
		v_ser1: [15000,1000,17000]
		v_ser2: [106009,111068,115431]
		colors: ['#EA5514','#ADCF32']
		c1_label: '流失客户（人）'
		c2_label: '老客户（人）'
	constructor: ->
		super
		$("article").html @render()
		@initChart()
	initChart: (data) ->
		for i in [1,2,3]
			console.log JSON.stringify(@getOptions(i,data))
			$('#chart' + i).highcharts @getOptions(i,data)
	export: ->
		chart1 = $('#chart1').highcharts()
		chart2 = $('#chart2').highcharts()
		chart3 = $('#chart3').highcharts()
		options =
			url: "http://192.168.88.110:8080/export/"
		Highcharts.exportCharts([chart1,chart2,chart3],options)
	render: ->
		@html require("views/chart16")(@opts)
	submit: (e) ->
		e.preventDefault()
		$form = $(e.currentTarget)
		obj = $form.serializeArray()
		serializedData = {}
		$.each obj, (index, field)->
			serializedData[field.name] = field.value
		@initChart(serializedData)
	formatData: (data) ->
		data = $.extend {},@opts,data
		# convert
		if $.type(data.month) is "string"
			data.month = data.month.split(";")
		if $.type(data.v_ser1) is "string"
			data.v_ser1 = $.map data.v_ser1.split(";"),(d) ->
				Number(d)
		if $.type(data.v_ser2) is "string"
			data.v_ser2 = $.map data.v_ser2.split(";"),(d) ->
				Number(d)
		# data.ar = []
		# for d,i in data.v_ser1
		# 	hash =
		# 		type: "pie"
		# 		name: data.h_ser[i]
		# 		data: [
		# 			{
		# 				name: data.h_ser[i] + data.c1_label
		# 				y: data.v_ser1[i]
		# 				sliced: true
		# 			},
		# 			[data.h_ser[i] + data.c2_label,data.v_ser2[i]]
		# 		]
		# 		center: [(i + 1)*240, 150]
		# 		size: 150
		# 	data.ar.push hash
		data
	getOptions: (i,data) ->
		data = @formatData(data)
		percent = Math.round(data.v_ser1[i - 1]*1000/data.v_ser2[i - 1])/10
		params =
			colors: data.colors
			chart:
				width: 200
				borderRadius: 0
			credits:
				enabled: false
			exporting:
				enabled: false
			title:
				text: data.month[i - 1] + "<br>" + percent + "%"
				verticalAlign: "bottom"
				y: -20
				useHTML: true
				style:
					fontSize: "18px"
					color: "#222"
			tooltip:
				enabled: false
			plotOptions:
				pie:
					allowPointSelect: true
					cursor: 'pointer'
					borderWidth: 2
					showInLegend: true
					startAngle: 0
					dataLabels:
						softConnector: false
						enabled: true
						distance: 10
						color: '#333'
						connectorColor: '#666'
						connectorWidth: 0
						# format: '{point.percentage:.1f} %'
						format: '{point.y}'
			series: [
				type: 'pie'
				# innerSize: '30%'
				size: 150
				data: [
					{
						name: data.c1_label
						y: data.v_ser1[i - 1]
						sliced: true
					},
					[data.c2_label,data.v_ser2[i - 1]]
				]
			]
		if i is 3
			legend =
				legend:
					enabled: true
					layout: 'vertical'
					align: 'right'
					verticalAlign: 'top'
					floating: true
					x: 0
					y: 50
					borderWidth: 0
		else
			legend =
				legend:
					enabled: false
		params = $.extend {},params,legend