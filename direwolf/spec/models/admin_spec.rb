require 'rspec'
require 'rails_helper'

describe Admin do

  before do
    @admin = Admin.new({:user_id => 'abc'})
  end

  it "new admin should return things" do
    expect(@admin[:user_id]).to eq 'abc'
  end

end