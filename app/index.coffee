require('lib/setup')
Spine = require('spine')

class App extends Spine.Controller
	categories: [
		id: 1
		name: "每月消费总额分析"
	,
		id: 2
		name: "各行业消费总额占比分析"
	,
		id: 3
		name: "银行卡总量分析"
	,
		id: 4
		name: "各消费金额区间的刷卡量分析-1"
	,
		id: 41
		name: "各消费金额区间的刷卡量分析-2"
	,
		id: 5
		name: "月刷卡金额对比分析"
	,
		id: 6
		name: "月均客单价对比分析"
	,
		id: 7
		name: "月消费金额占比走势分析"
	,
		id: 8
		name: "月均客单价波动分析"
	,
		id: 9
		name: "每周交易额分析"
	# ,
	# 	id: 10
	# 	name: "卡所属银行分析"
	,
		id: 11
		name: "客户消费能力分析-1"
	,
		id: 111
		name: "客户消费能力分析-2"
	,
		id: 12
		name: "新老客户对比分析"
	,
		id: 13
		name: "新老客户的消费金额对比分析"
	,
		id: 14
		name: "老客户的购买频次分析-1"
	,
		id: 141
		name: "老客户的购买频次分析-2"
	,
		id: 15
		name: "沉默、老客户对比分析"
	,
		id: 16
		name: "流失客户、老客户对比"
	,
		id: 17
		name: "流失客户在同行业其他商户的月消费情况"
	]
	release: ->
		@view.release() if @view
		$("footer nav").html require("views/footer")(collection: @categories)
	constructor: ->
		@routes
			"": ->
				Spine.Route.navigate("/", true)
			"/": ->
				@release()
				$("article").html require("views/categories")(collection: @categories)
			"chart/:id": (params) ->
				@release()
				ChartDetail = require("controllers/chart#{params.id}")
				@view = new ChartDetail()
$ ->
	Highcharts.setOptions
		lang:
			resetZoom: "复原"
			printChart: "打印图表"
			downloadJPEG: "下载 jpeg 图片"
			downloadPDF: "下载 pdf 文档"
			downloadPNG: "下载 png 图片"
			downloadSVG: "下载 svg 矢量图片"
	new App()
	Spine.Route.setup()
	# $('footer').affix
	# 	offset:
	# 		top: 100
	# 		bottom: 10