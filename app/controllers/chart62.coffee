ChartBase = require("controllers/chart_base")
# 流失客户中外的客户来源占比
# pie chart children: [10]
class Chart62 extends ChartBase
	opts:
		category: ['德阳市','西安市','南充市','邛崃市','绵阳市','广州市','上海市','深圳市','重庆市','北京市','其他']
		percent: [1.11,1.16,1.22,1.23,1.68,2.03,3.36,4.07,5.07,10.52,28.77]
		h_label: '城市'
		v_label: '来源占比'
		title_label: '流失客户中外的客户来源占比'
		colors: ["#E60012","#EA5514","#F49C22","#F5B222","#FDD000","#F4E02C","#F5E842","#F2F197","#CEE294","#A9D06A","#97C72F"]
	render: ->
		@html require("views/chart36")(@opts)
	formatData: (data) ->
		data = $.extend {},@opts,data
		if $.type(data.category) is "string"
			data.category = data.category.replace(/；/g,';').split(";")
		if $.type(data.percent) is "string"
			str = data.percent.replace(/%/g,'').replace(/；/g,';')
			data.percent = $.map str.split(";"), (d) ->
				Number(d)
		data.ar = []
		for d,i in data.category
			data.ar.push [d,data.percent[i]]
		data
	getOptions: (data) ->
		data = @formatData(data)
		params =
			credits:
				enabled: false
			chart:
				plotBackgroundColor: null
				plotBorderWidth: null
				plotShadow: false
			exporting:
				enabled: true
			title:
				text: data.title_label
				x: -100
				y: 50
			tooltip:
				enabled: false
			legend:
		        enabled: true
		        layout: 'vertical'
		        borderWidth: 0
		        align: 'right'
		        x: -100
		       	itemMarginTop: 6
		        itemMarginBottom: 6
		        verticalAlign: 'middle'
		        itemStyle:
		        	fontSize: '10px'
		        labelFormatter: ->
		        	this.name + ':' + this.percentage.toFixed(1) + '%'
			plotOptions:
				pie:
					allowPointSelect: true
					cursor: 'pointer'
					borderWidth: 2
					size: 230
					startAngle: 0
					colors: data.colors
					showInLegend: true
					dataLabels:
						softConnector: false
						enabled: false
						color: '#333'
						fontSize: '12px'
						connectorColor: '#666'
						format: '<b>{point.name}</b>: {point.percentage:.2f} %'
			series: [
				type: 'pie'
				# innerSize: '30%'
				data: data.ar
			]

module.exports = Chart62
