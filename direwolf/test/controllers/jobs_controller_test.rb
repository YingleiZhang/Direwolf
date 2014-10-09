require '../test_helper'

class JobControllerTest < ActionController::TestCase
  setup do
    @controller = JobsController.new
    @job = jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end

end
