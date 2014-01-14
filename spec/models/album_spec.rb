require 'spec_helper'

describe Album do

	it "is invalid without a name" do
		contact = FactoryGirl.build(:album, name: nil)
		expect(contact).to have(1).errors_on(:name)
	end	
end