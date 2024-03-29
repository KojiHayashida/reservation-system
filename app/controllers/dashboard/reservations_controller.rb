class Dashboard::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  layout "dashboard/dashboard"

  def index
    if params[:picked_date].present?
      picked_date = params[:picked_date].strip
      @reservations = Reservation.search_reservations(picked_date).includes(:user)
    else
      @reservations = Reservation.where("day = ?", Date.current).includes(:user)
    end
  end

  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_back(fallback_location: dashboard_user_path)
    else
      render :index
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:success] = "予約を削除しました"
      redirect_back(fallback_location: dashboard_user_path)  ## TODO ridirect先がおかしい
    else
      render :index
    end
  end

  private
  def authenticate_admin!
    unless current_user&.admin?
      redirect_to root_path, alert:  "アクセス権限がありません."
    end
  end

  def reservation_params
    params.permit(:day, :time, :user_id, :start_time)
  end
end
