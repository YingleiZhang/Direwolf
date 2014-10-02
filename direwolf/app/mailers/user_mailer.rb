class UserMailer < ActionMailer::Base
  default from: 'direwolfapp.user1@gmail.com'

  def application_submitted(job_application)
  	@job_application = job_application
  	@seeker = Seeker.find @job_application.seeker_id
    @employer = Employer.find @job_application.employer_id
    @job = Job.find @job_application.job_id
  	mail( to: @employer.email, subject: 'Job Application Submitted' )
  end

  def application_status(job_application)
  	@job_application = job_application
  	@seeker = Seeker.find @job_application.seeker_id
    @employer = Employer.find @job_application.employer_id
    @job = Job.find @job_application.job_id
  	mail( to: @seeker.email, subject: 'Application Status Updated' )
  end

end
