class FeaturedArtsController < ApplicationController
  before_action :set_featured_art, only: [:show, :edit, :update, :destroy]

  # GET /featured_arts
  # GET /featured_arts.json
  def index
    @arts = Art.all
    @featured_arts = FeaturedArt.all
  end

  # GET /featured_arts/1
  # GET /featured_arts/1.json
  def show
  end

  # GET /featured_arts/new
  def new
    @arts = Art.all
    @featured_art = FeaturedArt.new
  end

  # GET /featured_arts/1/edit
  def edit
  end

  # POST /featured_arts
  # POST /featured_arts.json
  def create
    @featured_art = FeaturedArt.new(featured_art_params)
    if @featured_art.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /featured_arts/1
  # PATCH/PUT /featured_arts/1.json
  def update
    respond_to do |format|
      if @featured_art.update(featured_art_params)
        format.html { redirect_to @featured_art, notice: 'Featured art was successfully updated.' }
        format.json { render :show, status: :ok, location: @featured_art }
      else
        format.html { render :edit }
        format.json { render json: @featured_art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_arts/1
  # DELETE /featured_arts/1.json
  def destroy
    @featured_art.destroy
    respond_to do |format|
      format.html { redirect_to featured_arts_url, notice: 'Featured art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featured_art
      @featured_art = FeaturedArt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def featured_art_params
      #params.fetch(:featured_art, {})

      params.require(:featured_art).permit(:x_coord, :y_coord, :art_id)
    end
end
