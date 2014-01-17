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
	,
		id: 20
		name: "月刷卡量分析"
	,
		id: 211
		name: "各消费频次区间的刷卡量分析2-1"
	,
		id: 212
		name: "各消费频次区间的刷卡量分析2-2"
	,
		id: 24
		name: "月刷卡对比分析"
	,
		id: 25
		name: "每月交易额分析"
	,
		id: 26
		name: "每月交易量分析"
	,
		id: 27
		name: "每周交易量分析"
	,
		id: 28
		name: "周均客单价波动分析"
	,
		id: 29
		name: "日均交易金额分析"
	,
		id: 30
		name: "日均交易量分析"
	,
		id: 32
		name: "新、老客户客单价对比分析"
	,
		id: 33
		name: "流失客户在同行业其他商户的月消费频次分析"
	,
		id: 34
		name: "新客户与老客户中本地、外地客户对比分析2-1"
	,
		id: 35
		name: "新客户与老客户中本地、外地客户对比分析2-2"
	,
		id: 36
		name: "新客户与老客户中外地客户来源占比分析2-1"
	,
		id: 37
		name: "新客户与老客户中外地客户来源占比分析2-2"
	,
		id: 38
		name: "每月卡均消费额分析"
	,
		id: 39
		name: "城市消费能力指数2-1"
	,
		id: 40
		name: "城市消费能力指数2-2"
	,
		id: 411
		name: "银行卡总量对比分析"
	,
		id: 42
		name: "当月百货行业消费总额对比分析"
	,
		id: 43
		name: "日均客单价波动分析"
	,
		id: 44
		name: "每季度交易额分析"
	,
		id: 45
		name: "每季度交易量分析"
	,
		id: 46
		name: "季均客单价波动分析"
	,
		id: 47
		name: "本地客户消费占比分析"
	,
		id: 48
		name: "沉默客户本地外地客户对比分析"
	,
		id: 49
		name: "沉默客户购买频次2-1"
	,
		id: 50
		name: "沉默客户购买频次2-2"
	,
		id: 51
		name: "沉默客户在同行业其他商户的人均月刷卡量分析"
	,
		id: 52
		name: "沉默客户在同行业其他商户的人均月消费金额分析"
	,
		id: 53
		name: "沉默、老客户每月人均支出对比分析"
	,
		id: 54
		name: "流失客户中本地、外地客户对比分析"
	,
		id: 55
		name: "流失客户购买频次2-1"
	,
		id: 56
		name: "流失客户购买频次2-2"
	,
		id: 57
		name: "流失客户在同行业其他商户的每月人均月刷卡量分析"
	,
		id: 58
		name: "流失客户在同行业其他商户的人均月消费金额分析"
	,
		id: 59
		name: "流失、老客户每月人均消费支出对比分析"
	,
		id: 60
		name: "月卡均消费金额"
	,
		id: 61
		name: "沉默客户中外地客户来源占比分析"
	,
		id: 62
		name: "流失客户中外的客户来源占比"
	,
		id: 63
		name: "新老客户月消费金额对比分析"
	,
		id: 64
		name: "新、老客户月刷卡量对比分析"
	,
		id: 65
		name: "人均月支出对比"
	,
		id: 66
		name: "人均月消费笔数对比"
	,
		id: 67
		name: "客户性别占比情况分析"
	,
		id: 68
		name: "城市月刷卡金额按区间分布"
	,
		id: 69
		name: "所在行业与全城消费金额对比"
	,
		id: 70
		name: "商圈内月刷卡频次按不同区间分布"
	,
		id: 71
		name: "商圈内消费金额分析"
	,
		id: 72
		name: "商圈内刷卡金额对比分析"
	,
		id: 73
		name: "商圈内消费群体年龄分布"
	,
		id: 74
		name: "消费人数分析"
	,
		id: 75
		name: "客户年龄分布"
	,
		id: 76
		name: "商户月刷卡量在商圈占比分析"
	,
		id: 77
		name: "客户月消费能力分析"
	,
		id: 78
		name: "有车人士人数统计分析"
	,
		id: 79
		name: "客户在其他地区同行业消费分析"
	,
		id: 80
		name: "各时点交易金额分析"
	,
		id: 81
		name: "各类目商品每日消费金额统计"
	,
		id: 82
		name: "各类目商品每日消费次数统计"
	,
		id: 83
		name: "各类目商品每日客单价统计"
	,
		id: 84
		name: "各类目消费性别分析"
	]
	release: ->
		@view.release() if @view

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
			"chart/:id/clean": (params) ->
				@release()
				ChartDetail = require("controllers/chart#{params.id}")
				@view = new ChartDetail(clean: true)
			"json": (params) ->
				for cat,i in @categories
					# @release()
					ChartDetail = require("controllers/chart#{cat.id}")
					@view = new ChartDetail(clean: true,id: i + 1)
$ ->
	Highcharts.setOptions
		lang:
			resetZoom: "复原"
			printChart: "打印图表"
			downloadJPEG: "下载 jpeg 图片"
			downloadPDF: "下载 pdf 文档"
			downloadPNG: "下载 png 图片"
			downloadSVG: "下载 svg 矢量图片"
	app = new App()
	Spine.Route.setup()
	$("header .container").append require("views/footer")(collection: app.categories)

