module AdminsHelper
  include UsersHelper
  def get_admin_id
    if user_is :admin
      uid = get_user_id
      admin = Admin.find_by user_id: uid
      id = admin.id
      return id
    else
      return nil
    end
  end

  def admins_only
    if user_is :admin
      yield
    else
      permission_denied("You_are_not_an_Admin")
    end
  end

end

