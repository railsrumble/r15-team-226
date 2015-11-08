var map;
var zoom_level = 8;
var center;
var lat;
var lng;
var marker;
var markers = [];
var infowindow;

//Map intialization
function initAutocomplete() {

  $.ajax({
type: 'get',
url: '/get_current_user_location/',
dataType: 'json',
success: function(data) {
if (data != false) {
  lat = data["lattitude"];
  lng = data["longitude"];
  address = data["address"]
  center = new google.maps.LatLng(lat, lng);
  $("#pac-input").val(address);
  //displayMarkers();

  map = new google.maps.Map(document.getElementById('map'), {
  center: center,
  zoom: zoom_level,
  mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  var position = new google.maps.LatLng(center.lat(), center.lng());
  marker = new google.maps.Marker({
    position: position,
    map: map,
    zoom: zoom_level
  });
} else {
}
}
});


}



//AutoComplete search location
function autoCompleteLocation(){


  var input = document.getElementById('pac-input');

  //var types = document.getElementById('type-selector');
  //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  //map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);
  marker.setMap(null);

  infowindow = new google.maps.InfoWindow();
  marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });

  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      window.alert("Autocomplete's returned place contains no geometry");
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setIcon(/** @type {google.maps.Icon} */({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    }));
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);
  });

  // // Sets a listener on a radio button to change the filter type on Places
  // // Autocomplete.
  // function setupClickListener(id, types) {
  //   var radioButton = document.getElementById(id);
  //   radioButton.addEventListener('click', function() {
  //     autocomplete.setTypes(types);
  //   });
  // }
  //
  // setupClickListener('changetype-all', []);
  // setupClickListener('changetype-address', ['address']);
  // setupClickListener('changetype-establishment', ['establishment']);
  // setupClickListener('changetype-geocode', ['geocode']);

}
