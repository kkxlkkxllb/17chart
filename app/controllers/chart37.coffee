ChartBase = require("controllers/chart_base")
# 各行业消费总额占比分析
# pie chart children: [10]
class Chart37 extends ChartBase
	opts:
		category: ['北京市','上海市','邛崃市','深圳市','重庆市','广州市','绵阳市','南充市','南京市','天津市','其他']
		h_label: '城市'
		v_label: '来源占比'
		percent: [22.1,13.7,8.9,6.8,4.4,3.2,1.9,1.6,1.5,1.3,34.6]
		colors: ["#507205","#789B2E","#9DB33F","#ADCF32","#D6DD5D","#EDEA4F","#F0CE44","#EFBA38","#F5A830","#F18F30","#EF7B31"]
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
				text: '<span style="font-size: 15px">外地老客户来源分布情况</span>'
				x: -100
				y: 50
			tooltip:
				enabled: false
			legend:
		        layout: 'vertical'
		        borderWidth: 0
		        align: 'right'
		        x: -100
		       	itemMarginTop: 6
		        itemMarginBottom: 6
		        itemStyle:
		        	fontSize: '10px'
		        verticalAlign: 'middle'
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
						fontSize: '12px'
						color: '#333'
						connectorColor: '#666'
						format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			series: [
				type: 'pie'
				# innerSize: '30%'
				data: data.ar
			]

module.exports = Chart37
