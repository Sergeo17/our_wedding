# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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



  Welcome0 = $('#household_guests_attributes_0_welcome_party_true')
  Welcome0regret = $('#household_guests_attributes_0_welcome_party_false')
  Wedding0 = $('#household_guests_attributes_0_wedding_true')
  Wedding0regret = $('#household_guests_attributes_0_wedding_false')
  Breakfast0 = $('#household_guests_attributes_0_breakfast_true')
  Breakfast0regret = $('#household_guests_attributes_0_breakfast_false')

  Welcome1 = $('#household_guests_attributes_1_welcome_party_true')
  Welcome1regret = $('#household_guests_attributes_1_welcome_party_false')
  Wedding1 = $('#household_guests_attributes_1_wedding_true')
  Wedding1regret = $('#household_guests_attributes_1_wedding_false')
  Breakfast1 = $('#household_guests_attributes_1_breakfast_true')
  Breakfast1regret = $('#household_guests_attributes_1_breakfast_false')

  RSVPSubmit = $('#RSVPSubmit')
  Shuttle0true = $('#household_guests_attributes_0_shuttle_true')
  Shuttle0false = $('#household_guests_attributes_0_shuttle_false')
  Shuttle1true = $('#household_guests_attributes_1_shuttle_true')
  Shuttle1false = $('#household_guests_attributes_1_shuttle_false')




  Welcome0.change ->
    if Welcome0.prop("checked") is true
      $('#Email0').show(200)

  Welcome0regret.change ->
    if Welcome0regret.prop("checked") is true and Wedding0regret.prop("checked") is true and Breakfast0regret.prop("checked") is true
      $('#Email0').hide(200)

  Wedding0.change ->
    if Wedding0.prop("checked") is true
      $('#Email0').show(200)
      $('#Wedding0').show(200)

  Wedding0regret.change ->
    if Welcome0regret.prop("checked") is true and Wedding0regret.prop("checked") is true and Breakfast0regret.prop("checked") is true
      $('#Email0').hide(200)
      $('#Wedding0').hide(200)
    else if Wedding0regret.prop("checked") is true
      $('#Wedding0').hide(200)

  Breakfast0.change ->
    if Breakfast0.prop("checked") is true
      $('#Email0').show(200)

  Breakfast0regret.change ->
    if Welcome0regret.prop("checked") is true and Wedding0regret.prop("checked") is true and Breakfast0regret.prop("checked") is true
      $('#Email0').hide(200)

  Welcome1.change ->
    if Welcome1.prop("checked") is true
      $('#Email1').show(200)

  Welcome1regret.change ->
    if Welcome1regret.prop("checked") is true and Wedding1regret.prop("checked") is true and Breakfast1regret.prop("checked") is true
      $('#Email1').hide(200)

  Wedding1.change ->
    if Wedding1.prop("checked") is true
      $('#Email1').show(200)
      $('#Wedding1').show(200)

  Wedding1regret.change ->
    if Welcome1regret.prop("checked") is true and Wedding1regret.prop("checked") is true and Breakfast1regret.prop("checked") is true
      $('#Email1').hide(200)
      $('#Wedding1').hide(200)
    else if Wedding1regret.prop("checked") is true
      $('#Wedding1').hide(200)

  Breakfast1.change ->
    if Breakfast1.prop("checked") is true
      $('#Email1').show(200)

  Breakfast1regret.change ->
    if Welcome1regret.prop("checked") is true and Wedding1regret.prop("checked") is true and Breakfast1regret.prop("checked") is true
      $('#Email1').hide(200)


  RSVPSubmit.submit = ->
    shuttle0true = shuttle0true.prop("checked")
    shuttle0false = shuttle0false.prop("checked")
    wedding = Wedding1.prop("checked")
    if wedding is true and shuttle0false is false and shuttle0true is false
      alert "Please let us know if you will be riding the shuttle. Thanks!"
      false


