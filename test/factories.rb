FactoryGirl.define do

	factory :user do
		first_name 'First'
		last_name 'Last'
		sequence(:email) {|n| "user#{n}@example.com"}
		sequence(:profile_name) {|n| "user#{n}"}

		password "mypassword"
		password_confirmation "mypassword"
	end

	factory :project_funding do
		association :user, factory: :user
		association :investment, factory: :project

		factory :pending_project_funding do
			state 'pending'
		end

		factory :requested_project_funding do
			state 'requested'
		end

		factory :accepted_project_funding do
			state 'accepted'
		end
	end
	
end