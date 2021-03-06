ChartBase = require("controllers/chart_base")
# 每月消费总额分析
class Chart1 extends ChartBase
	opts:
		h_ser: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
		h_label: '月份'
		v_ser: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
		v_label: '刷卡金额(亿元)'
		groupPadding: 0.1
		colors: ["#DE2A23"]
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
				type: data.yAxisType || null
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
					# borderWidth: 0
					groupPadding: data.groupPadding || 0.2
					pointPadding: 0.3
					color: data.colors[0]
					dataLabels:
						enabled: true
						y: -15
						color: data.colors[0]
						style:
							fontSize: '14px'
			series: [
				data: data.v_ser
			]


module.exports = Chart1