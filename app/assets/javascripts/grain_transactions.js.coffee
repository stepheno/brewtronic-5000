# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#grain_transaction_grain_id').parent().hide()
  grains = $('#grain_transaction_grain_id').html()
  $('#grain_transaction_grain_supplier_id').change ->
    grain_supplier = $('#grain_transaction_grain_supplier_id :selected').text()
    escaped_grain_supplier = grain_supplier.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(grains).filter("optgroup[label='#{escaped_grain_supplier}']").html()
    if options
      $('#grain_transaction_grain_id').html(options)
      $('#grain_transaction_grain_id').parent().show()
    else
      $('#grain_transaction_grain_id').empty()
      $('#grain_transaction_grain_id').parent().hide()
