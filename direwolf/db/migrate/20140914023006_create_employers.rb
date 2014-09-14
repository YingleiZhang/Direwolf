class CreateEmployers < ActiveRecord::Migration
  def change

    drop_table :employers
    create_table :employers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :employers
  end
end
