class UsersController < ApplicationController
  before_action :verify_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      flash[:success] = "Rejestracja zakończona powodzeniem"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def verify_user
    @user = User.find_by_id(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end
end
