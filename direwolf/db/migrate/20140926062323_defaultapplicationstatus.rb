class Defaultapplicationstatus < ActiveRecord::Migration
  def change
    change_column :job_applications, :status_id, :integer, :default=>1
  end
end
