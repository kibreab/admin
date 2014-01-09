class AdminTask < ActiveRecord::Base
	require 'money'    
	include Money 
	
	 def available_money
		store_money_value
	 end

	 def security_code_correct?(code)
	 	code == Money.code
	 end

	 public
	 def store_money_value
	 	Money.money_in_store - AdminTask.sum('money')
	 end
end
