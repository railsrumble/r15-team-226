$(document).ready(function(){
  window.setTimeout(function() {
    $(".alert-fade").fadeTo(1500, 0).slideUp(500, function(){
      $(this).remove();
    });
  }, 2000);
});

function fade_away_alert(){
  window.setTimeout(function() {
    $(".alert-fade").fadeTo(1500, 0).slideUp(500, function(){
      $(this).remove();
    });
  }, 2000);
}

// enabling first message from the list
if ($('.first-message-enable').length) {
  $(window).load(function() {
     $('.first-message-enable a:first').click();
  });
  }
