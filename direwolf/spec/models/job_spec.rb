require 'rspec'
require 'rails_helper'

describe Job do

  before do
    @job = Job.new
  end

  it 'should validate existence of params' do
    expect(@job.save).to eq(false)
  end

  it 'should allow a job to be added' do
    @job.title = 'A job title'
    @job.employer_id = 'myJobId'
    @job.category_id = '1'
    expect(@job.save).to eq(true)
  end

end