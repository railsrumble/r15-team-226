class DashboardController < ApplicationController
  before_action :authenticate_owner!, only: [:dashboard]
  def index
    render :index, :layout => 'dashboard'
  end

  def dashboard
    @current_owner_pets = current_owner.pets

  end


  def homepage


  end
end
