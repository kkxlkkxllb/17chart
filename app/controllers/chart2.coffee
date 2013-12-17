ChartBase = require("controllers/chart_base")
# 各行业消费总额占比分析
class Chart2 extends ChartBase
	opts:
		category: ['酒店住宿','教育培训','医疗保健','生活便利','老字号','家居建材','购物逛街','汽车服务','金融证券','买房租房','其他']
		percent: [1,1,2,6,6,7,8,9,15,22,23]
	render: ->
		@html require("views/chart2")(@opts)
	getOptions: (data) ->
		data = $.extend {},@opts,data
		if $.type(data.category) is "string"
			data.category = data.category.split(";")
		if $.type(data.percent) is "string"
			str = data.percent.replace(/%/g,'')
			data.percent = $.map str.split(";"), (d) ->
				Number(d)
		ar = []
		for d,i in data.category
			ar.push [d,data.percent[i]]

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
				text: ''
			tooltip:
				enabled: false
			plotOptions:
				pie:
					allowPointSelect: true
					cursor: 'pointer'
					borderWidth: 2
					# startAngle: -60
					colors: ["#c0392b","#f1c40f","#27ae60","#3498db","#1abc9c"]
					dataLabels:
						enabled: true
						color: '#333'
						connectorColor: '#666'
						format: '<b>{point.name}</b>: {point.percentage:.1f} %'
			series: [
				type: 'pie'
				# innerSize: '30%'
				data: ar
			]

module.exports = Chart2