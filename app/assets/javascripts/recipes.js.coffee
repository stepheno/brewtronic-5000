# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  # Setup remove 'x's for removing dynamic fields
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('tr').remove()
    event.preventDefault()

  # Setup autcomplete rendering style
  $.ui.autocomplete::_renderItem = (ul, item) ->
    $("<li></li>").data("item.autocomplete", item).append("<a>" + item.name + "</a>").appendTo( ul )

  # Big nasty dynamic autcomplete field addition
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('objectid'), 'g')
    closest_table = $(this).siblings('table').find('tr').last()
    new_row = $(this).data('fields').replace(regexp, time)
    closest_table.after(new_row)
    virt_attr_input_field_id = '#' + $(new_row).find('input')[0].id
    id_input_field_id = '#' + $(new_row).find('input')[1].id

    $(virt_attr_input_field_id).autocomplete(
      minLength:1
      source: $(this).data('source')
      focus: (event, ui) ->
        $(virt_attr_input_field_id).val ui.item.name
        false
      change: (event, ui) ->
        unless $(this).val() is $(this).data('autocomplete_name')
          $(this).addClass('autocomplete-error')
          $(this).siblings('input').val ''
        false
      select: (event, ui) ->
        $(virt_attr_input_field_id).val ui.item.name
        $(id_input_field_id).val ui.item.id
        $(this).data('autocomplete_name', ui.item.name)
        $(this).removeClass('autocomplete-error')
        false
    )
    event.preventDefault()

  $('#recipe_creation_date').datepicker
    dateFormat: 'yy-mm-dd'

  # Add autcomplete to all fields of class 'recipe_autocomplete'
  $(".recipe_autocomplete").each ->
    $(this).autocomplete (
      minLength:1
      source: $(this).data("source")
      focus: (event, ui) ->
        $(this).val ui.item.name
        false
      change: (event, ui) ->
        unless $(this).val() is $(this).data('autocomplete_name')
          $(this).addClass('autocomplete-error')
          $(this).siblings('input').val ''
        false
      select: (event, ui) ->
        $(this).val ui.item.name
        $(this).siblings('input').val ui.item.id
        $(this).data('autocomplete_name', ui.item.name)
        $(this).removeClass('autocomplete-error')
        false
    )

  $('#recipe_wizard').wizard().on 'finished', ->
    $('#new_recipe').submit()
    $('.edit_recipe').submit()

  $('#btn_wizard_next').wizard().on 'click', ->
    $('#recipe_wizard').wizard('next', 'foo')

  $('#btn_wizard_prev').wizard().on 'click', ->
    $('#recipe_wizard').wizard('previous')

