var breeds;
$(document).ready(function(){
  window.setTimeout(function() {
    $(".alert-fade").fadeTo(1500, 0).slideUp(500, function(){
      $(this).remove();
    });
  }, 2000);
var dog_breeds = ["Retrievers (Labrador)", "German Shepherds", "Retrievers (Golden)", "Bulldogs", "Beagles", "Yorkshire Terriers", "Poodles", "Boxers", "French Bulldogs", "Rottweilers", "Dachshunds", "Pointers (German Shorthaired)", "Siberian Huskies", "Doberman Pinschers", "Great Danes"];
var cat_breeds = ["Abyssinian", "American Shorthair", "Birman", "Maine Coon", "Oriental", "Persian", "Ragdoll", "Siamese", "Sphynx", "Scottish Fold", "Cornish Rex", "Devon Rex", "Oriental", "Norwegian Forest Cat", "Burmese", "Siberian", "Tonkinese", "Russian Blue"] ;
  $('#pet_pet_type').change(function(){
    switch ($('#pet_pet_type').val()) {
      case 'dog':
        breeds = dog_breeds;
        remove_existing_options();
        console.log('In swith dog')
        add_options_to_breed_field(breeds)
        break;
      case 'cat':
        breeds = cat_breeds;
        remove_existing_options();
        console.log('In swith cat')
        add_options_to_breed_field(breeds)
        break;
      case '':
        remove_existing_options();
        break;
    }
  });




});

function add_options_to_breed_field(breeds){
  remove_existing_options();
  $.each(breeds, function(key, value) {
    $('#pet_breed')
    .append($("<option>" + value +"</option>")
    .attr("value",value ));
  });

}

function remove_existing_options(){
  $('#pet_breed')
  .find('option')
  .remove()
  .end()
  .append('<option value="">Select Breed</option>');
}





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
