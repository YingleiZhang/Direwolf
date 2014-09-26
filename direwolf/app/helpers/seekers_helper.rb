module SeekersHelper

  include UsersHelper
  def get_seeker_id
    if user_is :seeker
      uid = get_user_id
      seeker = Seeker.find_by user_id: uid
      id = seeker.id
      return id
    else
      return nil
    end
  end

  def seeker_owns application_id
    id = get_seeker_id
    if id
      if Application.find(application_id).seeker_id == id
        return :true
      end
    end
    return :false
  end

end
