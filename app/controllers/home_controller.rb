class HomeController < ApplicationController
  before_action :verify_admin, only: [:admin, :admin_update]
  before_action :get_page

  # GET
  def index
    @arts = Art.where(:featured => true).order(:position)
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
  end

  def page_params
    params.require(:page).permit(:about, :contact)
  end

end
