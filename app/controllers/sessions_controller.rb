class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	# jeżeli użytkownik istnieje && jego hasło jest prawidłowe
    if user && user.authenticate(params[:session][:password])
    	sign_in user
      redirect_to root_path
    else
    	flash.now[:danger] = 'Nieprawidłowy email lub hasło!'
    	render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
