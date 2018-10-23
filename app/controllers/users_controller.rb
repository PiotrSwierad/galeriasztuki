class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      #todo
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
end
