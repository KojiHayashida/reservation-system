class Dashboard::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
    before_action :set_user, only: [:show, :edit, :update]

    layout "dashboard/dashboard"


    def index
        if params[:keyword].present?
            @keyword = params[:keyword].strip
            @users = User.search_information(@keyword).display_list(params[:pages])
        else
            @keyword = ""
            @users = User.display_list(params[:pages])
        end
    end

    def show
        @reservations = Reservation.where("user_id = ?", params[:id]).order(day: :asc)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.save
        redirect_to dashboard_users_path,  notice: "User was successfully created."
    end

    def edit

    end

    def update
        @user.update(user_params)
            redirect_to dashboard_users_path, notice: 'User was successfully updated.'
    end

   def destroy          ##　関連する予約の削除もしないといけない？？
        @user = User.find(params[:id])
        if @user.destroy
           redirect_to dashboard_users_path,  notice: "User was successfully deleted."
        else
            render :show
        end
   end

   private
        def set_user
            @user = User.find(params[:id])
        end

        def authenticate_admin!
            unless current_user&.admin?
                redirect_to root_path, alert:  "You are not authorized to access this page."
            end
        end

        def user_params         # require(:user)を外したら動くようになったけど大丈夫だろうか？
         params.permit(:family_name, :first_name, :family_name_reading, :first_name_reading,
                                  :email, :password, :password_confirmation)
        end
  end
