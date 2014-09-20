class NameUpdate < ActiveRecord::Migration
  def change
    add_column :seekers, :name, :string
    add_column :employers, :name, :string
    add_column :admins, :name, :string
  end
end
