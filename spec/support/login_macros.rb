module LoginMacros
	def sign_in(user)
		visit root_path
		click_link 'Log In'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
	end
end