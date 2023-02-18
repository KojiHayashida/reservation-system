class UsersController < ApplicationController       ## マイページのプログラム
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]

  def show
  end

  private
    def set_user
      @user = User.find(current_user.id)
      @user_reservations = Reservation.where(user_id: current_user.id).where("day >= ?", Date.current).order(day: :desc)
      @visit_historys = Reservation.where(user_id: current_user.id).where("day < ?", Date.current).where("day > ?", Date.current << 12).order(day: :desc)
    end

end
