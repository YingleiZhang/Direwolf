require 'rspec'
require 'rails_helper'

describe User do

  before do
    @user = User.new
  end

  it 'should not require any params' do
    expect(@user.save).to eq(true)
  end

end