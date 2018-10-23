class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	# jeżeli użytkownik istnieje && jego hasło jest prawidłowe
    if user && user.authenticate(params[:session][:password])
    	#todo login
    else
    	flash.now[:danger] = 'Nieprawidłowy email lub hasło!'
    	render 'new'
    end

  end

  def destroy
  end

end
