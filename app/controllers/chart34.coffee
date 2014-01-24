# 流失客户、老客户对比
module.exports = class Chart34 extends Spine.Controller
	className: "container"
	events:
		"submit form": "submit"
	opts:
		month: ['新客户']
		v_ser1: [62.6]
		v_ser2: [37.4]
		colors: ['#EA5514','#FDD000']
		c1_label: '本地客户占比'
		c2_label: '外地客户占比'
	constructor: ->
		super
		$("article").html @render()
		@initChart()
	initChart: (data) ->
		for i in [1]
			$('#chart' + i).highcharts @getOptions(i,data)
			console.log JSON.stringify(@getOptions(i,data))

	render: ->
		@html require("views/chart33")(@opts)
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
		data
	getOptions: (i,data) ->
		data = @formatData(data)
		#percent = Math.round(data.v_ser1[i - 1]*1000/data.v_ser2[i - 1])/10
		params =
			colors: data.colors
			credits:
				enabled: false
			chart:
				plotBackgroundColor: null
				plotBorderWidth: null
				plotShadow: false
			exporting:
 				url: "http://192.168.88.110:8080/export/"
			#exporting:
 				#enabled: true
			title:
				text: data.month[i - 1]
				verticalAlign: "top"
				y: 45
				useHTML: true
				style:
					fontSize: "22px"
					color: "#222"
			tooltip:
				pointFormat: ': <b>{point.percentage:.1f}%</b>'
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
						color: '#333'
						connectorColor: '#666'
						#format: ':'
						style:
							fontSize: '15px'
						distance: 42
						#connectorWidth: 0
						connectorPadding: 25
						format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			series: [
				type: 'pie'
				# innerSize: '30%'
				size: 150
				data: [
					{
						name: data.c1_label
						y: data.v_ser1[i - 1]
					},
					{
						name: data.c2_label
						y: data.v_ser2[i - 1]
						sliced: true
					}
				]
			]
		if i is 1
			legend =
				legend:
					enabled: false
		else
			legend =
				legend:
					enabled: false
		params = $.extend {},params,legend
