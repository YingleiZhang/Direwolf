require '../test_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do
    @admin = Admin.new
    @admin.user_id = 1
    @admin.email = "da_cheese"
    @admin.save
  end

  test "should redirect to welcome" do
    get root_path
    assert_redirected_to "/home/register/"
  end
end
