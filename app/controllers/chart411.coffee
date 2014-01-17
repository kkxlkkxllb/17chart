ChartBase = require("controllers/chart_base")
# 月刷卡量分析
class Chart411 extends ChartBase
	opts:
		h_ser: ['北京','上海','广州','南京','成都','重庆','杭州','武汉','郑州','西安','天津','济南','沈阳','昆明','福州','合肥','哈尔滨','南宁','贵阳','兰州','海口']
		h_label: '城市'
		v_ser: [2699,2512,2156,842,795,685,680,630,587,531,518,461,447,364,353,302,284,284,185,167,115]
		v_label: '城市银行卡数量（万张）'
		groupPadding: 0.1
	render: ->
		@html require("views/chart1")(@opts)
	formatData: (data) ->
		data = $.extend {},@opts,data
		# convert
		if $.type(data.h_ser) is "string"
			str = data.h_ser.replace(/；/g,';')
			data.h_ser = str.split(";")
		if $.type(data.v_ser) is "string"
			str = data.v_ser.replace(/%/g,'')
			data.v_ser = $.map str.split(";"),(d) ->
				Number(d)
		data
	getOptions: (data) ->
		data = @formatData(data)
		params =
			credits:
				enabled: false
			chart:
				type: 'column'
				marginTop: 40
				width: 900
			title:
				text: ' '
			tooltip:
				enabled: false
			legend:
				enabled: true
				# align: 'right'
				# verticalAlign: 'top'
				# floating: true
				x: 350
				itemMarginTop: 30
				borderWidth: 0
				layout:'vertical'
				align: 'center'
				verticalAlign: 'top'
				y: 0
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
					offset: 30
					enabled: false
			yAxis:
				maxPadding: 0.2
				lineColor: "#888"
				lineWidth: 2
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
					enabled:false
				labels:
					enabled: false
				gridLineWidth: 0
			plotOptions:
				column:
					# borderRadius: 10
					# borderRadiusTopLeft: 30
					# borderRadiusTopRight: 30
					# arrowTop: true
					# pointPadding: -0.3
					groupPadding: data.groupPadding || 0.2
					# borderWidth: 0
					pointPadding:0.3
					color: "#EA5514"
					dataLabels:
						enabled: true
						y: -20
						x: 10
						color: '#888'
						rotation: 315
						style:
							fontSize: '14px'
			series: [
				name: data.v_label
				type: 'column'
				data: data.v_ser
			]


module.exports = Chart411
