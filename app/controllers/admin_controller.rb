class AdminController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "finsoc2017"
	protect_from_forgery with: :exception
  include AdminHelper

  def index
		if session[:logged_in] == true
			redirect_to :action => "control_panel"
		end
  end

  def check_login
    if params[:session][:user] != "warrenbuffett" && params[:session][:user] != "edwardren"
			flash[:danger] = "Invalid"
      redirect_to :controller => "main", :action => "index"
    else
			log_in 'admin'
      redirect_to :action=> "control_panel"
    end
  end

	def control_panel
		if session[:logged_in] != true
			redirect_to :controller => "main", :action => "index"
		end
	end 
end
