class DashboardController < ApplicationController
  before_action :authenticate_owner!, only: [:dashboard]
  def index

  end

  def dashboard


  end


  def homepage


  end
end
