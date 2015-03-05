require 'spec_helper'

describe User do
	let(:valid_attributes){
		{
			first_name: "Melodic",
			last_name: "Island",
			email: "user@melodicisland.com"
		}
	}
	context "validations" do
		let(:user) { User.new(valid_attributes) }
		
		before do
			User.create(valid_attributes)
		end

		it "requires an email" do 
			expect(user).to validate_presence_of(:email)
		end

		it "requires a unique email" do
			expect(user).to validate_uniqueness_of(:email)
		end

		it "requires a unique email (case insensitive)" do
			user.email = "USER@MELODICISLAND.COM"
			expect(user).to validate_uniqueness_of(:email)
		end
	end
	context "#downcase_email" do
		it "makes the email attribute lower case" do
			user = User.new(valid_attributes.merge(email: "USER@MELODICISLAND.COM"))
			user.downcase_email
			expect(user.email).to eq("user@melodicisland.com")
		end

		it "downcase an email before saving" do
			user = User.new(valid_attributes)
			user.email = "USER@MELODICISLAND.COM"
			expect(user.save).to be_true
			expect(user.email).to eq("user@melodicisland.com")
		end
	end
end
