# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#hop_transaction_hop_id').parent().hide()
  hops = $('#hop_transaction_hop_id').html()
  $('#hop_transaction_hop_supplier_id').change ->
    hop_supplier = $('#hop_transaction_hop_supplier_id :selected').text()
    escaped_hop_supplier = hop_supplier.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(hops).filter("optgroup[label='#{escaped_hop_supplier}']").html()
    if options
      $('#hop_transaction_hop_id').html(options)
      $('#hop_transaction_hop_id').parent().show()
    else
      $('#hop_transaction_hop_id').empty()
      $('#hop_transaction_hop_id').parent().hide()
