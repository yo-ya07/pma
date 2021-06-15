class PasswordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]
  before_action :set_password, only: [:show, :edit, :update, :destroy]
  before_action :user_validation, only: [:edit, :update]
  before_action :user_deletion, only: [:destroy]
  before_action :sold_item, only: [:edit, :update, :destroy]

  def index
    @passwords = Password.all
  end

  def new
    @password  = Password.new
  end

  def create
    @password  = Password.new(password_params)
    if @password.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @password.update(password_params)
      redirect_to passwords_path
    else
      render :new
    end
  end

  def destroy
    if @password.destroy
      return redirect_to root_path
    end
  end

  private
  def password_params
    params.require(:password).permit(:login_title, :registration_email, :created_password,
                                     :login_url, :memo).merge(user_id: current_user.id)
  end

  def set_password
    @password = Password.find(params[:id])
  end

  def user_validation
    redirect_to root_path unless current_user.id == @password.user_id
  end

  def user_deletion
    redirect_to passwords_path unless current_user.id == @password.user_id
  end

  def sold_item
    redirect_to root_path if @password.management.present?
  end
end
