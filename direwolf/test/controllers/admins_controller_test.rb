require '../test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = admins(:one)
  end


  # When using omniauth you can't just access admin page
  test "should get index" do
    get :index
    assert_response 302
  end

  test "should show admin" do
    get :show, id: @admin
    assert_response 302
  end

  test "should get edit" do
    get :edit, id: @admin
    assert_response 302
  end

end
