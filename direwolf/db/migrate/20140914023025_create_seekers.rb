class CreateSeekers < ActiveRecord::Migration
  def change

    drop_table :seekers
    create_table :seekers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :seekers
  end
end
