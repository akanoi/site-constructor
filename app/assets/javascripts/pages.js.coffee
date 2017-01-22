# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.component-editor').froalaEditor()

  $('#add-left-component').click ->
    $('#body-form-left').show()
    $(this).hide()

  $('#add-right-component').click ->
    $('#body-form-right').show()
    $(this).hide()

  $('#add-top-component').click ->
    $('#body-form-top').show()
    $(this).hide()

  $('#add-bottom-component').click ->
    $('#body-form-bottom').show()
    $(this).hide()