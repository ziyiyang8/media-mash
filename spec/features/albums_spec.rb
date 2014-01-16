require 'spec_helper'

feature 'Album management' do
	scenario 'adding a new album', js: true do
		set_speed(:slow)
		
		user = create(:user)

		sign_in user

		visit root_path

		expect {
			click_link 'New'
			fill_in 'Name', with: 'Test Album'
			click_button 'Create Album'
		}.to change(Album, :count).by(1)

		#save_and_open_page

		expect(current_path).to eq user_album_path
	end
end