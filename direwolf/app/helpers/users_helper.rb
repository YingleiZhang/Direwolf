module UsersHelper
  def user_is should_be
    id = session[:user_id]
    if User.exists?(id)
      info = User.find(id)
      should_be = :user
      if Seeker.exists?(user_id: info.uid)
        should_be = :seeker
      else
        if Employer.exists?(user_id: info.uid)
          should_be = :employer
        else
          if Admin.exists?(user_id: info.uid)
            should_be = :admin
          else
            should_be = nil
          end
        end
      end
    else
      should_be = nil
    end
    if actually_is == should_be
      return :true
    else
      return :false
    end
  end

end

