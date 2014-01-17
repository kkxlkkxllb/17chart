ChartBase = require("controllers/chart_base")
# 城市消费能力指数2-1
class Chart39 extends ChartBase
	opts:
		h_ser: [7959,7035,6495,1515]
		h_label: '刷卡笔数(万笔)'
		v_ser: [2111,1814,1398,1397]
		z_ser: ['北京','上海','广州','郑州']
		v_label: '刷卡金额(亿元)'
		color: "#006383"
	render: ->
		@html require("views/chart39")(@opts)
	formatData: (data) ->
		data = $.extend {},@opts,data
		if $.type(data.z_ser) is "string"
			str = data.z_ser.replace(/；/g,';')
			data.z_ser = str.split(";")
		if $.type(data.v_ser) is "string"
			str = data.v_ser.replace(/；/g,';')
			data.v_ser = $.map str.split(";"),(d) ->
				Number(d)
		if $.type(data.h_ser) is "string"
			str = data.h_ser.replace(/；/g,';')
			data.h_ser = $.map str.split(";"),(d) ->
				Number(d)

		data.datas = []
		for item,i in data.h_ser
			data.datas[i] =
				data: [[item,data.v_ser[i],1]]
				dataLabels:
					enabled: true
					color: "#000"
					format: data.z_ser[i]
					y: -2
					x: 27
					style:
						textShadow: '0px 0px 0px black'
						fontSize: '13px'
		# console.log data.datas
		data
	getOptions: (data) ->
		data = @formatData(data)
		params =
			credits:
				enabled: false
			chart:
				hight: 600
				width: 800
				type: "bubble"
				zoomType: "xy"
			legend:
				enabled: false
			title:
				enabled: true
				text: ''
			tooltip:
				enabled: false
			plotOptions:
				bubble:
					color: "#ef4136"
					minSize: 12
					maxSize: 12
			xAxis:
				labels:
					enabled: true
				lineColor: "#888"
				lineWidth: 2
				gridLineDashStyle: 'longdash'
				gridLineColor: "#C9CACA"
				gridLineWidth: 0.5
				title:
					text: data.h_label
					align: "high"
					y: -10
			yAxis:
				maxPadding: 0.2
				maxPadding: 0.2
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: 5
				gridLineDashStyle: 'longdash'
				gridLineColor: "#C9CACA"
				gridLineWidth: 0.5
				lineColor: "#888"
				lineWidth: 2
				labels:
					enabled: true
			series:
				data.datas

module.exports = Chart39
