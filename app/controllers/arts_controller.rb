class ArtsController < ApplicationController
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy, :make_featured]
  before_action :get_art, only: [:show, :edit, :update, :destroy, :make_featured]

  def index
    @arts = Art.search(params[:title_contains]).paginate(page: params[:page], :per_page => 12)
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
      redirect_to arts_url
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

  #funkcja sortowania obrazów po ustaleniu ich układu na home page
  def sort
    params[:art].each_with_index do |id, index|
      Art.where(id: id).update_all(position: index + 1)
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
    params.require(:art).permit(:title, :author, :image, :technique, :year, :price, :availability)
  end

end
