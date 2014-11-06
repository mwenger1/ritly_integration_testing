require 'rails_helper'

feature "Logins", :type => :feature do
	let!(:user) { User.create_with_password('bla','secretbla') }

	scenario "works with valid user" do
		visit "/sessions/new"

		fill_in "username", with: "bla"
		fill_in "password", with: "secretbla"

		click_button "Login"

		expect(page).to have_text("Welcome back bla!")
	end

	scenario "fails with invalid user" do
		visit "/sessions/new"

		fill_in "username", with: "bla"
		fill_in "password", with: "bad_password"

		click_button "Login"

		expect(page).to have_text("Invalid username or password.")
	end
end
