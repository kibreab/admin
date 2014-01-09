class AdminTasksController < ApplicationController
  def index
  	@admin_task = AdminTask.new
  	@transfers = AdminTask.all
  end

  def create
  		money_is_number = true if (admin_params[:money].to_i != 0) #Float(params[:money]) rescue false
  		flash[:error] = "Please put numbers only" if !money_is_number 
  		if money_is_number && AdminTask.create(admin_params)
  			flash[:success] = "Successfully sent money to company"
  		else
  			flash[:error] = "Couldn't save to db"
  		end
  		redirect_to :back
  end

  def destroy
  	if AdminTask.find(params[:id]).destroy
  		flash[:success] = "Successfully deleted transfer"
  	else
  		flash[:error] = "There was a problem deleting"
  	end
  	redirect_to :back
  end

  def sign_out
  	puts "session will be"
  	session[:user_name] = nil
  	redirect_to '/admin_register'
  	puts "session is ladies #{session}"
  end

   private
   def admin_params
   	 params.require(:admin_task).permit(:money, :company)
   end
end
