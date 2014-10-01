require 'rspec'
require 'rails_helper'

describe Employer do

  before do
    @employer = Employer.new
  end

  it 'should require name' do
    expect(@employer.save).to eq(false)
  end

  it 'should only require a name, company, email, and user_id' do
    @employer.name = 'Contact Name'
    @employer.company_name = 'Another Company'
    @employer.email = 'comp@comp.com'
    @employer.user_id = '1'
    expect(@employer.save).to eq(true)
  end

end