# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#conference_location').change ->
    $.ajax type: "POST", url: '/conferences/update_location', data: {location: $('#conference_location').val() }

  $( "#conference_start_date" ).datepicker({
    changeMonth: true,
    numberOfMonths: 3,
    onClose: ( selectedDate )->
      $( "#conference_start_date" ).datepicker( "option", "minDate", selectedDate );
  });
  $( "#conference_end_date" ).datepicker({
    changeMonth: true,
    numberOfMonths: 3,
    onClose: ( selectedDate )->
      $( "#conference_end_date" ).datepicker( "option", "maxDate", selectedDate );
  });

