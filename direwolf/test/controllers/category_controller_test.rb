require '../test_helper'

class CategoryControllerTest < ActionController::TestCase

  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response 302
  end

end
