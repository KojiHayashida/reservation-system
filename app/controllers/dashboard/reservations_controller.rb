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

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy  ## TODO 元の利用者予約一覧のページにリダイレクトするようにしたい
    end

    private
        def authenticate_admin!
            unless current_user&.admin?
               redirect_to root_path, alert:  "You are not authorized to access this page."
            end
        end
end
