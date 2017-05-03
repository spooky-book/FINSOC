module AdminHelper
	
	# Session Login for Admin
	def log_in(user)
		session[:logged_in] = true
	end
end
