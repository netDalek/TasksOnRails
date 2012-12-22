# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("body").delegate("[data-ajax]", "click", () ->
    self = $(this)
    self.parent().load(self.data("ajax"))
  )
  $("#not_assigned").click(()->
    if ($(this).attr("checked"))
      $("#user_id").attr("disabled", "disabled")
    else
      $("#user_id").removeAttr("disabled")
  )
