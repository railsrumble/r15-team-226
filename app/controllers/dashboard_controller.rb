class DashboardController < ApplicationController
  before_action :authenticate_owner!, only: [:dashboard]
  def index

  end

  def dashboard
    @current_owner_pets = current_owner.pets

  end


  def homepage


  end
end
