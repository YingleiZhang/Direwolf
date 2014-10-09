require '../test_helper'

class JobApplicationsControllerTest < ActionController::TestCase

  setup do
    @jobApp = job_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response 302
  end

end
