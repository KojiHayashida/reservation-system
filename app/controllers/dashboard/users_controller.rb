class Dashboard::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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

  def edit

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = 'password'
    @user.password_confirmation = 'password'
    @user.save!
    redirect_to dashboard_users_path, notice: "ユーザー作成に成功しました."
  end

  def update
    @user.update_without_password(user_params)
    redirect_to dashboard_users_path, notice: 'ユーザー情報の編集が完了しました'
  end

  def destroy          ##　関連する予約の削除もしないといけない？？
    if @user.destroy!
      redirect_to dashboard_users_path,  notice: "ユーザー削除に成功しました."
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

  def user_params
    params.require(:user).permit(:family_name, :first_name, :family_name_reading, :first_name_reading,
                            :email, :password, :password_confirmation)
  end
end
