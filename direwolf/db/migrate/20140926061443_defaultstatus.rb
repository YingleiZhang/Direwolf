class Defaultstatus < ActiveRecord::Migration
  def change
    Status.create :title =>"rejected"
    Status.create :title =>"accepted"
    Status.create :title =>"pending"
  end
end
