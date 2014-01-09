require 'spec_helper'

describe AdminTask do
	before do
	 @admin_task = FactoryGirl.create(:admin_task, :company => 'Metso')
	 @available_money = @admin_task.available_money
	end

	it "should return available money in the store" do
		@available_money.should > 0
	end
 end

# describe  do
# 	 @admin = FactoryGirl.create(:admin_register, :name => 'admin', :user_name => 'admin_user')

# 	it "should allow the right admin to transfer money " do
# 		@admin.user_name should eq('admin_user')
# 	end
# end