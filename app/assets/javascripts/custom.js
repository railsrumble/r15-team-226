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

  $(document).ready(function() {
    $(".message_item").click(function(){
      $('#message_receiver_id').val($(this).data('user-id'));
      params = {user_id: $(this).data('user-id')};
  		$.ajax({
  			type : "GET",
  			url : '/messages/user_messages/',
  			data : params,
  			dataType : "html",
  			success : function(data) {
  				$('.message-panel').html(data);
  			}
  		});
    });
  });
