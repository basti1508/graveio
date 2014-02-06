require 'test_helper'

class Users::RegistrationsControllerTest < ActionController::TestCase
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should list posts for specific user" do
    @user = users(:kmerz) 
    get :posts, user_id: @user.id
    assert_response :success
    assert_select "h3", /.*#{@user.email}.*/
    assert_not_nil assigns(:posts)
  end
end
