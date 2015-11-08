
$(".alert" ).fadeOut(4000);

// enabling first message from the list
if ($('.first-message-enable').length) {
  $(window).load(function() {
     $('.first-message-enable a:first').click();
  });
  }
