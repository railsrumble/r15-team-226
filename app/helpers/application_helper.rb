module ApplicationHelper

  def show_flash_message(flash)
    str = ""
    flash.keys.each do |key|
      alert_type = case key
      when 'notice'
        'success'
      when 'alert'
        'danger'
      end
      str += "<div class='alert alert-#{alert_type} alert-dismissable alert-fade margin-top-20'>\
         <div aria-hidden='true' data-dismiss='alert' class='close' type='button'>x</div>\
         <center>\
           #{ flash.send(key) if flash.respond_to? key }\
         </center>\
      </div>"
    end
    str.html_safe
  end


  def adoption_button(adoption_request)
    str = ""
    if adoption_request.adoption_responses.where(owner_id: current_owner.id).blank?
      str += link_to 'Adopt', adoption_request_adoption_responses_path(adoption_request, '[adoption_response]owner_id' => current_owner.id, '[adoption_response]adoption_request_id' => adoption_request), remote: :true, method: :post
      #str += "<a href=\"<%= adoption_request_adoption_responses_path(adoption_request, '[adoption_response]owner_id' => current_owner.id, '[adoption_response]adoption_request_id' => adoption_request %>\", data-method= 'post', data-remote= 'true', id = \"<%= adoption_request_#{adoption_request.id} %>\">Adopt</a>"
    else
      str += "<span class=\"label label-success\">Request sent</span>"
    end
    str.html_safe
  end

end
