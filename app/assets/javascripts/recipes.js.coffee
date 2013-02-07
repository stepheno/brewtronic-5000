# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $("#recipe_style_virt_attr").autocomplete(
    minLength: 2
    source: "/styles.json"
    focus: (event, ui) ->
      $("#recipe_style_virt_attr").val ui.item.name
      false

    select: (event, ui) ->
      $("#recipe_style_virt_attr").val ui.item.name
      $("#recipe_style_id").val ui.item.id
      false
  ).data("autocomplete")._renderItem = (ul, item) ->
    $("<li></li>").data("item.autocomplete", item).append("<a>" + item.name + "</a>").appendTo( ul )


    #select: (event, ui) ->
      #$("#recipe_style_virt_attr").val ui.item.name
      #$("#recipe_style_id").val ui.item.id
      #false
  #).data("autocomplete")._renderItem = (ul, item) ->
    #$("<li></li>").data("item.autocomplete", item).append("<a>" + item.name + "</a>").appendTo( ul )
