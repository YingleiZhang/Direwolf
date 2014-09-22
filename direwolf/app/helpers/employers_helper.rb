module EmployersHelper
  include UsersHelper
  def get_employer_id
    if user_is :employer
      uid = get_user_id
      employer = Employer.find_by user_id: uid
      id = employer.id
      return id
    else
      return nil
    end
  end

  def employer_owns job_id
    if user_is :employer
      if Job.find(job_id).employer_id == get_employer_id
        return :true
      end
    end
    return :false
  end

end

