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

end
