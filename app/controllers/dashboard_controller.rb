class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index]
  layout 'dashboard/dashboard'

  def index
  end

  private
  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert:  "You are not authorized to access this page."
    end
  end
end
