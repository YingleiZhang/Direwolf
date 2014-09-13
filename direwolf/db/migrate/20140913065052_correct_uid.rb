class CorrectUid < ActiveRecord::Migration
  def change
    remove_foreign_key(:seekers, :users)
    remove_foreign_key(:admins, :users)
    remove_foreign_key(:employers, :users)

    change_column :seekers, :user_id, :string
    change_column :admins, :user_id, :string
    change_column :employers, :user_id, :string
  end
end
