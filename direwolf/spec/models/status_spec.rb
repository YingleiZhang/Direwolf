require 'rspec'
require 'rails_helper'

describe Status do

  before do
    @status = Status.new
  end

  it 'should validate existence of params' do
    expect(@status.save).to eq(false)
  end

  it 'should allow a status to be added' do
    @status.title = 'Pending'
    expect(@status.save).to eq(true)
  end

end