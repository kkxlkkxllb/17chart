ChartBase = require("controllers/chart8")
# 城市消费能力指数2-2
class Chart40 extends ChartBase
	opts:
		h_ser: [1822,2057,2016,1892,1733,1613,1445,1203,1162,978,989,855,828,913,537,429,259]
		h_label: '刷卡笔数(万笔)'
		v_ser: [842,698,678,626,682,545,486,404,475,588,397,353,277,238,204,158,79]
		z_ser: ['杭州','南京','成都','重庆','武汉','天津','西安','济南','沈阳','福州','昆明','合肥','哈尔滨','南宁','贵阳','兰州','海口']
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
				text: ""
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
				maxPadding: 0.2
				gridLineDashStyle: 'longdash'
				gridLineColor: "#C9CACA"
				gridLineWidth: 0.5
				startOnTick: true
				title:
					text: data.h_label
					align: "high"
					y: -10
			yAxis:
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: 5
				startOnTick: true
				gridLineDashStyle: 'longdash'
				gridLineColor: "#C9CACA"
				gridLineWidth: 0.5
				lineColor: "#888"
				lineWidth: 2
				labels:
					enabled: true
			series:
				data.datas

module.exports = Chart40