require 'rspec'
require 'rails_helper'

describe Category do

  before do
    @category = Category.new
  end

  it 'should require name' do
    expect(@category.save).to eq(false)
  end

  it 'should only require a name' do
    @category.name = 'wolfpack'
    expect(@category.save).to eq(true)
    expect(@category.name).to eq('wolfpack')
  end

end