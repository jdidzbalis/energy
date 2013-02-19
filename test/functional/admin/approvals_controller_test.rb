require 'test_helper'

class Admin::ApprovalsControllerTest < ActionController::TestCase
  test "should get approve" do
    get :approve
    assert_response :success
  end

  test "should get deny" do
    get :deny
    assert_response :success
  end

end
