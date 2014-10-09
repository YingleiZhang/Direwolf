require '../test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get destroy" do
    get :destroy
    assert_response 302
  end

end
