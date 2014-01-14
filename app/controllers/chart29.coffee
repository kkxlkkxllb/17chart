ChartBase = require("controllers/chart_base")
# 月刷卡量分析
class Chart29 extends ChartBase
	opts:
		h_ser: ['星期一','星期二','星期三','星期四','星期五','星期六','星期日']
		h_label: '天'
		v_ser: [56.1,64.6,62.9,58.1,100.8,124.2,120.9]
		v_label: '日均交易额（万元）'
		groupPadding: 0.02
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
					borderRadiusTopLeft: 30
					borderRadiusTopRight: 30
					borderRadius: 10
					pointPadding:0.3
					color: "#036EB8"
					dataLabels:
						enabled: true
						y: -15
						color: '#036EB8'
						style:
							fontSize: '14px'
			series: [
				data: data.v_ser
			]


module.exports = Chart29
