class HomeController < ApplicationController
  before_action :verify_admin, only: [:admin]

  def index
  end

  def about
  end

  def contact
  end

  def admin
  	
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

end
