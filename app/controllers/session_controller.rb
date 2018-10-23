class SessionController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	debugger
  	#sprawdzenie czy istnieje użytkownik i czy jego hasło jest poprawne
  	if user && user.authenticate(params[:session][:password])
  		#logowanie
  		flash.now[:danger] = 'Coś się popsuło'
  	else
  		flash.now[:danger] = 'Nieprawidłowe hasło lub email!'
  		render 'new'
  	end

  end

  def destroy
  end
end
