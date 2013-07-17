# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#batch_target_date').datepicker
    dateFormat: 'yy-mm-dd'
  $('#batch_date').datepicker
    dateFormat: 'yy-mm-dd'
  $('#batch_wizard').wizard().on 'finished', ->
    $('#new_batch').submit()
  $('#btn_wizard_next').wizard().on 'click', ->
    $('#batch_wizard').wizard('next', 'foo')
  $('#btn_wizard_prev').wizard().on 'click', ->
    $('#batch_wizard').wizard('previous')
