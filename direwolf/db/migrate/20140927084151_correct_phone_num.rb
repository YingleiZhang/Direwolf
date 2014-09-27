class CorrectPhoneNum < ActiveRecord::Migration
  def change
    change_column :seekers, :phone, :string
  end
end
