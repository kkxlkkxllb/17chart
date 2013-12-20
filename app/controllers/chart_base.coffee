class ChartBase extends Spine.Controller
	className: "container"
	events:
		"submit form": "submit"
	constructor: ->
		super
		$("article").html @render()
		$('#chart').highcharts @getOptions()
	submit: (e) ->
		e.preventDefault()
		$form = $(e.currentTarget)
		obj = $form.serializeArray()
		serializedData = {}
		$.each obj, (index, field)->
			serializedData[field.name] = field.value
		$('#chart').highcharts @getOptions(serializedData)
module.exports = ChartBase