FactoryGirl.define do
	factory :admin_register do |f|
		f.name "KBSHA"
		f.password "32"
		f.user_name "admin_user"
	end

	factory :admin_task do |f|
		f.money 2000
		f.company "KELA"
	end
end