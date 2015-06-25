require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup
    @user = users(:tom)
  end
  
  test "login with invalid information" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, session: { email: "", password: "" }
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    post_via_redirect '/login', 'user[email]' => @user.email, 'user[password]' => 'password'
    assert_template 'users/show'
    assert_select "a[href=?]", new_user_session_path, count: 0
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", user_path(@user)
    assert_select 'h1', "Viewing your Profile"
  end

end
