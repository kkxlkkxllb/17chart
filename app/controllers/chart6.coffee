ChartBase = require("controllers/chart5")
# 月均客单价对比分析
class Chart6 extends ChartBase
	opts:
		h_ser: ['5月','6月','7月','8月','9月','10月']
		h_label: '月份'
		v_ser1: [762.9,710.1,738.5,755.4,913,926.9]
		v_ser2: [594.8,579.4,522.3,677.9,679.6,775.2]
		v_label: '每月客单价（元/笔）'
		c1_label: '行业消费客单价'
		c2_label: '商户消费客单价'
	getOptions: (data) ->
		data = @formatData(data)
		params =
			chart:
				type: 'column'
			credits:
				enabled: false
			title:
				text: "--"
			tooltip:
				enabled: false
			legend:
				enabled: true
				align: 'right'
				verticalAlign: 'top'
				floating: true
				x: -60
				borderWidth: 0
			xAxis:
				categories: data.h_ser
				title:
					text: data.h_label
					align: "high"
			yAxis:
				gridLineDashStyle: 'longdash'
				title:
					text: data.v_label
					align: "high"
					rotation: 0
					y: -15
					offset: 0
			plotOptions:
				column:
					dataLabels:
						enabled: true
					pointPadding: 0
			series: [
				name: data.c1_label
				data: data.v_ser1
			,
				name: data.c2_label
				data: data.v_ser2
			]

module.exports = Chart6