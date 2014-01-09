require 'spec_helper'

describe "AdminTasks" do
	before do
		@transfer = FactoryGirl.create(:admin_task, :money => 222, :company => "Nokia")
	end
  describe "GET /admin_tasks" do
    it "should list all available transfers" do
    	visit admin_tasks_path
    	page.should have_content "List of transfers"
    	page.should have_content "Nokia"
    end

    it "should correctly display the remaining bank money stored" do
    	visit admin_tasks_path
    	page.should have_content "Remaining money in store is: #{@transfer.available_money}"

    end

    it "submits money and company to transfer" do
      visit admin_tasks_index_path
      page.should have_content "Welcome administrator"
      page.should have_content "Transfer the money amount to the company you wished"
      fill_in 'admin_task_money', :with => 400
      #fill_in 'admin_tasks_code', :with => "555"
      fill_in 'admin_task_company', :with => "Subway"
      click_button "save"
      current_path.should == admin_tasks_index_path
      page.should have_content "Successfully sent money to company"

    end

    it "should complain when money is string" do
		visit admin_tasks_path
		page.should have_content "Transfer the money amount to the company you wished"
      	fill_in 'admin_task_money', :with => "string value"
      	fill_in 'admin_task_company', :with => "Subway"
      	click_button "save"
      	page.should have_content "Please put numbers only"
	end

	it "should delete transfer" do
		visit admin_tasks_path
		find("#task_#{@transfer.id}").click_link 'Delete'
		page.should have_content "Successfully deleted transfer"
	end

  end
end
