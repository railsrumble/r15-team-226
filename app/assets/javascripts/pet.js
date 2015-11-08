$(document).ready(function(){
  if($('#show_user_location').length)
    getUserLocation();
});

function getUserLocation(){
console.log('load..');
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
      $("#show_user_location").val(address);
      //displayMarkers();
    } else {
    }
  }
  });

}
