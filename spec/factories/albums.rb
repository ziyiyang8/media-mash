require 'faker'

FactoryGirl.define do
	factory :album do
		name { Faker::Lorem.sentence }
	end	
end