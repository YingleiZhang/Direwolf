require 'rspec'
require 'rails_helper'

describe JobApplication do

  before do
    @job_app = JobApplication.new
  end

  it 'should validate existence of params' do
    expect(@job_app.save).to eq(false)
  end

  it 'should allow a job application to be added' do
    @job_app.seeker_id = 'seeker'
    @job_app.employer_id = 'empId'
    @job_app.job_id = '1'
    expect(@job_app.save).to eq(true)
  end

end