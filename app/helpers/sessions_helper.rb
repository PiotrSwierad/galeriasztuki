module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id
	end

	def sign_out
		session.delete(:user_id)
		@current_user = nil
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user
		if session[:user_id]
			if @current_user.nil?
				@current_user = User.find_by(id: session[:user_id])
			else
				@current_user
			end
		end
	end
end
