module UsersHelper

	def gravatar_for(user, options = {size: 80})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.email, class: "gravatar")
	end

	def isAdmin
		if(!current_user.nil?)
			if(current_user.isAdmin == true)
				return true
			end
		end

		return false
	end

end
