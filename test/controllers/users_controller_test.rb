require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup 
		@user = User.new(name: "Example User", email: "user@example.com")
	end

	test "should be valid" do
		assert_response @user.valid?
	end
  
end
