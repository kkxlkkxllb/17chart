require('lib/setup')
Spine = require('spine')

class App extends Spine.Controller
	constructor: ->
		@routes
			"": ->
				Spine.Route.navigate("/", true)
			"/": ->
				$("article").html require("views/categories")()
			"chart/:id": (params) ->
				ChartDetail = require("controllers/chart#{params.id}")
				new ChartDetail(el: $("article"))
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
