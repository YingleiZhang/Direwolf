class CreateAdmins < ActiveRecord::Migration
  def change

    drop_table :admins
    create_table :admins do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
