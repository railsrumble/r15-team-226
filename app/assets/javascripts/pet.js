var placeSearch, autocomplete;
var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};
var component;

$(document).ready(function(){
  if($('#show_user_location').length)
    getUserLocation();
});

function getUserLocation(){
console.log('load..');

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success, error);
  } else {
    error('not supported');
  }

  function success(position) {
    lat = position.coords.latitude;
    lng = position.coords.longitude;
    $.ajax({
    type: 'get',
    url: '/get_location_name',
    data: {lat: lat, lng: lng},
    dataType: 'json',
    success: function(data) {
      if (data != false) {
        $("#show_user_location").val(data.result.replace(/\"/g, ""));
      } else {
      }
    }
    });
  }

  function error(position){
    console.log("=========ERROr-======================");
  }




}

//AutoComplete search location
function autoCompletePetLocation(){

  autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */(document.getElementById('show_user_location')),
      {types: ['geocode']});

google.maps.event.addListener(autocomplete, 'place_changed', function() {
var location_name = document.getElementById('show_user_location').value;
});
}
