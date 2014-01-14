class ChartBase extends Spine.Controller
	className: "container"
	events:
		"submit form": "submit"
	commonSettings: ->
		exporting:
 			url: "http://192.168.88.110:8080/export/"
 			# enabled: false
	constructor: ->
		super
		$("article").html @render()
		@initChart()
		if @clean
			$("#form,header").hide()
	initChart: (data) ->
		options = $.extend({}, @getOptions(data), @commonSettings())
		$('#chart').highcharts options
		console.log JSON.stringify(@getOptions(data))
	submit: (e) ->
		e.preventDefault()
		$form = $(e.currentTarget)
		obj = $form.serializeArray()
		serializedData = {}
		$.each obj, (index, field)->
			serializedData[field.name] = field.value
		@initChart(serializedData)
module.exports = ChartBase
