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
