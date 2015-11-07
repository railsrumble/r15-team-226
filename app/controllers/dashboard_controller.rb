class DashboardController < ApplicationController

  def index
    render :index, :layout => 'dashboard'
  end

end
