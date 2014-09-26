class ChangeStatusToString < ActiveRecord::Migration
  def change
    change_column :job_applications, :status_id, :string, :default=>"pending"
  end
end
