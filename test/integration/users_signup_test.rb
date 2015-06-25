require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, user: { username:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'devise/registrations/new'
    # assert_select 'div#<CSS id for error explanation>'
    assert_select 'div.has-error'
  end

	test "valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post_via_redirect user_registration_path, user: { username:  "Example User",
                                            email: "user@example.com",
                                            password:              "password11",
                                            password_confirmation: "password11" }
    end
    assert_template 'users/show'
    assert_not flash.empty?
	end

end
