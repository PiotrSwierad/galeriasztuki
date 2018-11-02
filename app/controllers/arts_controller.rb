class ArtsController < ApplicationController

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
    @art = Art.new(params.require(:art).permit(:title, :author, :image))
    if @art.save
      redirect_to @art
    else
      render :new
    end
  end

  # PATCH/PUT /arts/1
  def update
    @art = Art.find(params[:id])
    if @art.save
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

end
