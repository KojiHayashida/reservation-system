class Dashboard::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
    before_action :set_user, only: [:edit, :update]

    layout "dashboard/dashboard"


    def index
        @users = User.display_list(params[:pages]).order(id: :desc)
    end

    def new
        @user = User.new
    end

    def create                              ## TODO 入力パラメータが正しい形式かどうかチェックをしたい
        @user = User.new(user_params)
        @user.save
        redirect_to dashboard_users_path,  notice: "User was successfully created."
    end

    def edit

    end

    def update
        @user.update(user_params)
        redirect_to root    ## TODO edit ページにリダイレクト
    end

   def destroy
   end

   private
        def set_user
            @user = User.find(current_user.id)
        end

        def authenticate_admin!
            unless current_user&.admin?
                redirect_to root_path, alert:  "You are not authorized to access this page."
            end
        end

        def user_params
         params.require(:user).permit(:family_name, :first_name, :family_name_reading, :first_name_reading,
                                  :email, :password, :password_confirmation)
        end

  end
