module UsersHelper
  def user_is should_be
    id = session[:user_id]
    if User.exists?(id)
      info = User.find(id)

      if Seeker.exists?(user_id: info.uid)
        actually_is = :seeker
      else
        if Employer.exists?(user_id: info.uid)
          actually_is = :employer
        else
          if Admin.exists?(user_id: info.uid)
            actually_is = :admin
          else
            actually_is = nil
          end
        end
      end
    else
      actually_is = nil
    end
    if actually_is == should_be
      return true
    else
      return false
    end
  end

  def get_user_type

    id = session[:user_id]

    if User.exists?(id)
      info = User.find(id)

      if Seeker.exists?(user_id: info.uid)
        return :seeker
      end

      if Employer.exists?(user_id: info.uid)
        return :employer
      end

      if Admin.exists?(user_id: info.uid)
        return :admin
      end

    end

  end

  def get_user_id
    if User.exists?(session[:user_id])
      uid = User.find(session[:user_id]).uid
    else
      uid = nil
    end
  end


end

