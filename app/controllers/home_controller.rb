class HomeController < ApplicationController
  before_action :verify_admin, only: [:admin, :admin_update]
  before_action :get_page

  # GET
  def index
    @arts = Art.where(:featured => true)
  end

  # GET
  def about
  end

  # GET
  def contact
  end

  # GET
  def admin
  end

  # PATCH/PUT 
  def admin_update
    if @page.update_attributes(page_params)
      redirect_to admin_path
    else
      render :admin
    end
  end

  #POST
  def createPlaceholder
    art = Art.new
    art.title = "!placeholder!"
    art.featured = true
    art.position = Art.all.where(:featured => true).count
    art.hidden = true
    if art.save
      redirect_to root_path
    else
      flash[:danger] = 'Coś poszło nie tak!'
    end
  end

  private

  def verify_admin
  	if current_user.nil?
  		redirect_to signin_path
  		flash[:danger] = 'Zaloguj się aby móc kontynuować!'
  	elsif !current_user.isAdmin
  		redirect_to root_path
  		flash[:danger] = 'Nie posiadasz uprawnień do przeglądania tej strony!'
  	end
  end

  def get_page
    @page = Page.first
    @arts = Art.where(:hidden => false)
  end

  def page_params
    params.require(:page).permit(:about, :contact)
  end

end
