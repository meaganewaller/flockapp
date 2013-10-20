# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  geocoder = new google.maps.Geocoder();

  latLong = new google.maps.LatLng(40.7143528,-74.0059731);

  mapOptions = {
      zoom: 15,
      center: latLong,
      mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  callback = (results, status) ->
    if (status == google.maps.places.PlacesServiceStatus.OK)
      for result in results
        createMarker(result)

  createMarker = (place) ->
    console.log(place);
    placeLoc = place.geometry.location;
    m = {
      map: map,
      position: placeLoc,
    }
    if (place.icon)
      m.icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(0,0),
        scaledSize: new google.maps.Size(25,25)
      }
    marker = new google.maps.Marker(m);

    infowindow = new google.maps.InfoWindow();

    google.maps.event.addListener(marker, 'click', ->
      infowindow.setContent(place.name);
      infowindow.open(map, this);
    );

    for t in place.types
      $("#"+t).append("<div class='place'>" + place.name + "</div>");

  $('#conference_location').change ->
    geocoder.geocode({address: $('#conference_location').val()}, (results, status) ->
      if (status == google.maps.GeocoderStatus.OK)
        latLong = results[0].geometry.location;
        map.setCenter(latLong);
        createMarker({
          geometry: { location: latLong },
          name: $('#conference_name').val(),
          types: ['conference']
        });
        request = {
          location: latLong,
          radius: 5000,
          types: ['airport', 'atm', 'car_rental', 'grocery_or_supermarket', 'food', 'restaurant', 'subway_station', 'train_station']
        };
        service = new google.maps.places.PlacesService(map);
        service.nearbySearch(request, callback);
      else
        console.log("bad location: " + $('#conference_location'));
    );

  $( "#search_date" ).datepicker({
    changeMonth: true,
    numberOfMonths: 3,
    dateFormat: "yy-mm-dd"
  });

  $( "#conference_start_date" ).datepicker({
    changeMonth: true,
    numberOfMonths: 3,
    dateFormat: "yy-mm-dd",
    onClose: ( selectedDate )->
      $( "#conference_start_date" ).datepicker( "option", "minDate", selectedDate );
  });
  $( "#conference_end_date" ).datepicker({
    changeMonth: true,
    numberOfMonths: 3,
    dateFormat: "yy-mm-dd",
    onClose: ( selectedDate )->
      $( "#conference_end_date" ).datepicker( "option", "maxDate", selectedDate );
  });

