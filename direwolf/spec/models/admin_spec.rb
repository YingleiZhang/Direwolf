require 'rspec'
require 'rails_helper'

describe Admin do

  before do
    @admin = Admin.new({:user_id => 'abc'})
  end

  it "admin without email should fail" do
    expect(@admin.save).to eq(false)
  end

  it "admin with email shoul save" do
    @admin.email = 'test@gmail.com'
    expect(@admin.save).to eq(true)
    expect(@admin.email).to eq('test@gmail.com')
  end

end