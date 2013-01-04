# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#grain_supplier_grain_tokens").tokenInput "/grains.json", crossDomain: false, theme: 'facebook', prePopulate: $('grain_supplier_grain_tokens').data('pre')
