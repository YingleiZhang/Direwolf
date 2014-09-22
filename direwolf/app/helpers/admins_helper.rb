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
end

