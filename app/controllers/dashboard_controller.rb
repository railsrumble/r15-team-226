class DashboardController < ApplicationController
  before_action :authenticate_owner!, only: [:dashboard]
  layout 'application'
  def index
    render :index
  end

  def dashboard
    @current_owner_pets = current_owner.pets

  end


  def homepage


  end

end
