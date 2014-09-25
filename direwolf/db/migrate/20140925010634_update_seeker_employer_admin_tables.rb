class UpdateSeekerEmployerAdminTables < ActiveRecord::Migration
  def change

    remove_column :seekers, :resume
    remove_column :seekers, :resume_type
    add_column :seekers, :email, :string
    add_column :seekers, :resume, :text

    add_column :employers, :company_name, :string
    add_column :employers, :email, :string
    add_column :employers, :pending, :boolean

    add_column :admins, :email, :string
    add_column :admins, :pending, :boolean
  end
end
