var map;
var zoom_level = 8;
var center;
var lat;
var lng;
var marker;
var markers = [];
var infowindow;
var place;

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
  displayMarkers({address: address, lat: lat, lng: lng});

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
  //lat = map
  marker.setMap(null);

  infowindow = new google.maps.InfoWindow();
  marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });

  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    place = autocomplete.getPlace();
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

    //infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    //infowindow.open(map, marker);
    lat = place.geometry.location.lat();
    lng = place.geometry.location.lng();
    displayMarkers({address: address, lat: lat, lng: lng});
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

function displayMarkers(param){

console.log("==============PARAM========{address: address, place_name: place.name}====" + param["address"]);
getPets(param)
}
function getPets(param){

$.ajax({
  type: 'get',
  url: '/get_pets',
  data: {address: param["address"], latitude: param["lat"], longitude: param["lng"]},
  dataType: 'json',
  success: function(result) {
    if (result.lat) center = new google.maps.LatLng(result.latitude, result.longitude);
    var latlng  = [];
    var doggies = JSON.parse(result.pets);
    $.each(doggies, function(index, object) {
      if (object.area) {
        //latlng.push(new google.maps.LatLng(object.location.latitude, object.location.longitude));
       }
    });
    latlng.push(new google.maps.LatLng(result.lat, result.lng));

    var latlngbounds = new google.maps.LatLngBounds();
    for (var i = 0; i < latlng.length; i++) {
      latlngbounds.extend(latlng[i]);
    }

    //map.fitBounds(latlngbounds);
    //map.setCenter(new google.maps.LatLng(result.lat, result.lng));
    //map.setZoom(map.getZoom()-1);

    $.each(doggies, function(index, object) {

      if (object.area) {

        var position = new google.maps.LatLng(object.latitude, object.longitude);
        marker = new google.maps.Marker({
          position: position,
          map: map,
          //icon: icon,
          data_id: object.id,
        });
        //distanceBetweenCenterAndMarker = distanceBetweenTwoMarkers(position, distanceWidget.get('position'));
        marker.setVisible(true);
        markers.push(marker);

        google.maps.event.addListener(marker, 'click', function(event) {
          //user_data =  HandlebarsTemplates['search/user'](object);
          infoWindow.setContent(object);
        });
        } // End of if(object.location)
    });// End of each loop
  } // End of success function
}); // End of Ajax call
}

//Remove all markers to set new one
function deleteAllMarkers() {

for (var i = 0; i < markers.length; i++) {
markers[i].setMap(null);
}
markers = [];
}


//Distance between marker and map center
function distanceBetweenTwoMarkers(p1, p2) {
if (!p1 || !p2) {
return 0;
}

var R = 6371; // Radius of the Earth in km
var dLat = (p2.lat() - p1.lat()) * Math.PI / 180;
var dLon = (p2.lng() - p1.lng()) * Math.PI / 180;
var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
Math.cos(p1.lat() * Math.PI / 180) * Math.cos(p2.lat() * Math.PI / 180) *
Math.sin(dLon / 2) * Math.sin(dLon / 2);
var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
var d = R * c;
return d;
}//End of distanceBetweenTwoPoints function


function map_display(){

// Create the search box and link it to the UI element.
var input = document.getElementById('pac-input');
var searchBox = new google.maps.places.SearchBox(input);
map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

// Bias the SearchBox results towards current map's viewport.
map.addListener('bounds_changed', function() {
  searchBox.setBounds(map.getBounds());
});

var markers = [];
// [START region_getplaces]
// Listen for the event fired when the user selects a prediction and retrieve
// more details for that place.
searchBox.addListener('places_changed', function() {
  var places = searchBox.getPlaces();

  if (places.length == 0) {
    return;
  }

  // Clear out the old markers.
  markers.forEach(function(marker) {
    marker.setMap(null);
  });
  markers = [];

  // For each place, get the icon, name and location.
  var bounds = new google.maps.LatLngBounds();
  places.forEach(function(place) {
    var icon = {
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(25, 25)
    };

    // Create a marker for each place.
    markers.push(new google.maps.Marker({
      map: map,
      icon: icon,
      title: place.name,
      position: place.geometry.location
    }));

    if (place.geometry.viewport) {
      // Only geocodes have viewport.
      bounds.union(place.geometry.viewport);
    } else {
      bounds.extend(place.geometry.location);
    }
  });
  map.fitBounds(bounds);
});
// [END region_getplaces]
}
