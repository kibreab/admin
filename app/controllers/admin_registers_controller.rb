class AdminRegistersController < ApplicationController
  def index
  	@admins = AdminRegister.all
  	@admin = AdminRegister.new
  end

  def create
  	user_name = params[:admin_register][:user_name]
  	password = params[:admin_register][:password]
  	if user_name == 'admin_user' && password == "secret"
  		session[:user_name] = 'admin_user'
		redirect_to '/admin_tasks'
  	else
  		flash[:error] = "Please give the correct credentials"
  		redirect_to :back
  	end
  end

end
