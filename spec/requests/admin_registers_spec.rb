require 'spec_helper'

describe "AdminRegisters" do
	before do
		@admin = FactoryGirl.create(:admin_register, :name => "KB", :user_name => 'admin_user', :password => 'secret')
		@wrong_admin = FactoryGirl.create(:admin_register, :name => "zendro", :user_name => 'some_user', :password => 'incorrect')
	end

  describe "GET /admin_regiters" do
    it "should display new sign in path for right admins" do
      visit admin_registers_path
      page.should have_content 'please register or sign in'
      fill_in 'admin_register_user_name', :with => @admin.user_name
      fill_in 'admin_register_password', :with => @admin.password
      click_button 'sign in'
      current_path.should == admin_tasks_path
      page.should have_content "Welcome administrator"
    end

    it "should not allow other non admin users" do
    	visit admin_registers_path
    	page.should have_content "please register or sign in"
    	fill_in 'admin_register_user_name', :with => @wrong_admin.user_name
    	fill_in 'admin_register_password', :with => @wrong_admin.password
    	click_button 'sign in'
    	page.should have_content 'Please give the correct credentials'
    	current_path.should eq(admin_registers_path)
    	page.should have_content 'please register or sign in'
    end

  end

  describe "Get /admin_tasks" do
  	it "should create other users" do
  		visit admin_tasks_path
  		page.should have_link "Sign out"
  		page.should have_content "Dear Admin, you may now Transfer Tax money to funding companies"
  		
  	end	
  end
end
