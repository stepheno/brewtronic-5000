# Common functionality for the index pages
jQuery ->
  $('.delete_row').bind 'ajax:success', ->
    $(this).closest('tr').fadeOut()
