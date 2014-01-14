ChartBase = require("controllers/chart_base")
# 月刷卡量分析
class Chart38 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser: [8463.5,8315.3,8354.8,8474,9235.1,8812.2]
		v_label: '卡均消费金额（元/卡）'
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
				# width: 1000
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
				maxPadding: 0.2
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
					pointPadding:0.3
					color: "#DE2A23"
					dataLabels:
						enabled: true
						y: -15
						color: '#DE2A23'
						style:
							fontSize: '14px'
			series: [
				data: data.v_ser
			]


module.exports = Chart38
