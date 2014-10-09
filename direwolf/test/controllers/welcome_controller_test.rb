require '../test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "should redirect to welcome" do
    get :index
    assert_response 200
  end
end
