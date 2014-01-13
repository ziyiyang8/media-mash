require 'spec_helper'

describe Album do

	it "is invalid without a name" do
		expect(Album.new(name: nil)).to have(1).errors_on(:name)
	end	
end