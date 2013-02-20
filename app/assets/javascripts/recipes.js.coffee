# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('tr').remove()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('objectid'), 'g')
    closest_table = $(this).siblings('table').find('tr').last()
    new_row = $(this).data('fields').replace(regexp, time)
    closest_table.after(new_row)
    input_field = $(new_row).children('input')
   
    $("#"+$($(new_row).children()[0]).children('input').attr('id')).autocomplete(
      minLength:2
      source: $(this).data('source')
      focus: (event, ui) ->
        $("#"+$($(new_row).children()[0]).children('input').attr('id')).val ui.item.name
        false
      select: (event, ui) ->
        $("#"+$($(new_row).children()[0]).children('input').attr('id')).val ui.item.name
        $("#"+$($(new_row).children()[1]).attr('id')).val ui.item.id
        false
    ).data("autocomplete")._renderItem = (ul, item) ->
      $("<li></li>").data("item.autocomplete", item).append("<a>" + item.name + "</a>").appendTo( ul )
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

  $("#recipe_yeast_virt_attr").autocomplete(
    minLength: 2
    source: "/yeasts.json"
    focus: (event, ui) ->
      $("#recipe_yeast_virt_attr").val ui.item.name
      false

    select: (event, ui) ->
      $("#recipe_yeast_virt_attr").val ui.item.name
      $("#recipe_yeast_id").val ui.item.id
      false
  ).data("autocomplete")._renderItem = (ul, item) ->
    $("<li></li>").data("item.autocomplete", item).append("<a>" + item.name + "</a>").appendTo( ul )

  #$("#recipe_recipe_hops_attributes_0_hop_virt_attr").autocomplete(
    #minLength: 2
    #source: "/hops.json"
    #focus: (event, ui) ->
      #$("#recipe_recipe_hops_attributes_0_hop_virt_attr").val ui.item.name
      #false

    #select: (event, ui) ->
      #$("#recipe_recipe_hops_attributes_0_hop_virt_attr").val ui.item.name
      #$("#recipe_recipe_hops_attributes_0_hop_id").val ui.item.id
      #false
  #).data("autocomplete")._renderItem = (ul, item) ->
    #$("<li></li>").data("item.autocomplete", item).append("<a>" + item.name + "</a>").appendTo( ul )


  #$("#recipe_hop_virt_attr").autocomplete(
    #minLength: 2
    #source: "/hops.json"
    #focus: (event, ui) ->
      #$("#recipe_hop_virt_attr").val ui.item.name
      #false

    #select: (event, ui) ->
      #$("#recipe_hop_virt_attr").val ui.item.name
      #$("#recipe_hop_id").val ui.item.id
      #false
  #).data("autocomplete")._renderItem = (ul, item) ->
    #$("<li></li>").data("item.autocomplete", item).append("<a>" + item.name + "</a>").appendTo( ul )

