class Dashboard::UsersController < ApplicationController
    before_action :authenticate_user!
    layout "dashboard/dashboard"

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.save
        redirect_to root_path,  notice: "User was successfully created."
    end

    def index
        @users = User.display_list(params[:pages])
    end

   def destroy
   end

   private

        def user_params
         params.require(:user).permit(:family_name, :first_name, :family_name_reading, :first_name_reading,
                                  :email, :password, :password_confirmation)
        end

  end
