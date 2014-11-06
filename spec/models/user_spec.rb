require 'rails_helper'

RSpec.describe User, :type => :model do
  context "with password authentication" do

  	let!(:user){ User.create_with_password("test user", "secret") }
		let(:authenticated_user){ User.find_authenticated_user("test user", "secret") }


  	it "creates with password" do
  		expect(User.count).to eq 1
  	end

  	it "does not store plain text password" do
  		expect(:user['password']).not_to eq "secret"
  	end

  	it "authenticates with password" do
  		expect(authenticated_user).not_to be nil
  	end
  end

  context "validations" do
  	it "requires a username and password" do
  		user = User.new(username: "bla", password: "bla")
  		expect(user).to be_valid
  	end
  end
end
