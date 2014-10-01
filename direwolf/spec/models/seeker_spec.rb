require 'rspec'
require 'rails_helper'

describe Seeker do

  before do
    @seeker = Seeker.new
  end

  it 'should validate existence of params' do
    expect(@seeker.save).to eq(false)
  end

  it 'should allow a seeker to be added' do
    @seeker.email = 'jobseeker@needsjob.com'
    @seeker.phone = '1234567890'
    @seeker.user_id = '1'
    expect(@seeker.save).to eq(true)
  end

end