ChartBase = require("controllers/chart_base")
# 月刷卡量分析
class Chart44 extends ChartBase
	opts:
		h_ser: ['一季度','二季度','三季度','四季度']
		h_label: '季度'
		v_ser: [90359;113766;1189907;111940]
		v_label: '交易量（笔）'
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
				width: 700
			title:
				text: ' '
			tooltip:
				enabled: false
			legend:
				enabled: false
			xAxis:
				categories: data.h_ser
				lineColor: "#888"
				lineWidth: 2
				labels:
					y: 20
				title:
					text: data.h_label
					align: "high"
					# offset: 0
			yAxis:
				minPadding: 0.2
				maxPadding: 0.2
				# min: 5000
				startOnTick: false
				gridLineDashStyle: 'longdash'
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
					# borderRadius: 10
					# borderRadiusTopLeft: 30
					# borderRadiusTopRight: 30
					# arrowTop: true
					# pointPadding: -0.3
					groupPadding: data.groupPadding || 0.2
					# borderWidth: 0
					borderRadiusTopLeft: 30
					borderRadiusTopRight: 30
					borderRadius: 10
					pointPadding:0.3
					color: "#2EA7E0"
					dataLabels:
						enabled: true
						align:'high'
						y: -15
						color: '#2EA7E0'
						style:
							fontSize: '14px'
			series: [
				data: data.v_ser
			]


module.exports = Chart44
