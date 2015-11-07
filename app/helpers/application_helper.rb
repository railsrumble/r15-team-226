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
      str += "<div class='alert alert-#{alert_type} alert-dismissable margin-top-20'>\
         <button aria-hidden='true' data-dismiss='alert' class='close' type='button'>x</button>\
         <center>\
           <strong>#{ flash.send(key) if flash.respond_to? key }</strong>\
         </center>\
      </div>"
    end
    str.html_safe
  end

end
