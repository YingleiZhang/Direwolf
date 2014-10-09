require '../test_helper'

class SeekersControllerTest < ActionController::TestCase
  setup do
    @seeker = seekers(:one)
  end

  test "should get index" do
    get :index
    assert_response 302
  end

end
