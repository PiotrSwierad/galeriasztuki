class UsersController < ApplicationController
  before_action :verify_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  # GET /users/1
  def show
    @user = User.find_by_id(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      flash[:success] = "Rejestracja zakończona powodzeniem"
      redirect_to root_path
    else
      render 'new'
    end
  end

  
  # PATCH/PUT /users/1
  def update
  end

  # DELETE /users/1
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
