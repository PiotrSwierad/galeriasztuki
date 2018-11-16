class ArtsController < ApplicationController
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy]

  def index
    @arts = Art.all
  end

  # GET /arts/1
  def show
    @art = Art.find(params[:id])
  end

  # GET /arts/new
  def new
    @art = Art.new
  end

  # GET /arts/1/edit
  def edit
    @art = Art.find(params[:id])
  end

  # POST /arts
  def create
    @art = Art.new(art_params)
    if @art.save
      redirect_to @art
    else
      render :new
    end
  end

  # PATCH/PUT /arts/1
  def update
    @art = Art.find(params[:id])
    if @art.update_attributes(art_params)
      redirect_to @art
    else
      render :edit
    end
  end

  # DELETE /arts/1
  def destroy
    @art = Art.find(params[:id])
    if @art.destroy
      redirect_to arts_url
    end
  end


  private

  def verify_admin
    if current_user.nil?
      redirect_to signin_path
      flash.now[:danger] = 'Zaloguj się!'
    elsif !current_user.isAdmin
      redirect_to root_path
      flash.now[:danger] = 'Nie masz uprawnień!'
    end
  end

  def art_params
    params.require(:art).permit(:title, :author, :image, :technique, :year, :price, :availability)
  end

end
