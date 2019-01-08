class ArtsController < ApplicationController
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy, :make_featured]
  before_action :get_art, only: [:show, :edit, :update, :destroy, :make_featured]
  skip_before_action :verify_authenticity_token

  def index
    @arts = Art.search(params[:title_contains]).paginate(page: params[:page], :per_page => 8)
  end

  # GET /arts/1
  def show
  end

  # GET /arts/new
  def new
    @art = Art.new
  end

  # GET /arts/1/edit
  def edit
  end

  # POST /arts
  def create
    @art = Art.new(art_params)
    @art.featured = false
    if @art.save
      redirect_to @art
    else
      render :new
    end
  end

  # PATCH/PUT /arts/1
  def update
    if @art.update_attributes(art_params)
      redirect_to @art
    else
      render :edit
    end
  end

  # DELETE /arts/1
  def destroy
    if @art.destroy
      redirect_to root_path
    end
  end

  def make_featured
    if @art.featured
      @art.featured = false;
    else
      @art.featured = true;
    end

    if @art.save
      redirect_to @art
    else
      render :show
    end
  end

  #funkcja update layoutu do bazy
  def sort
    @featuredArts = JSON.parse(params[:data_value])
    @featuredArts.each do |f|
      if !f["id"].nil?
        Art.where(id: f["id"]).update_all(data_sizex: f["sizex"], data_sizey: f["sizey"], data_col: f["data-col"], data_row: f["data-row"])
      end  
    end

    head :ok
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

  def get_art
    @art = Art.find(params[:id])
  end

  def art_params
    params.require(:art).permit(:title, :author, :image, :technique, :year, :price, :availability, :width, :height)
  end

end
