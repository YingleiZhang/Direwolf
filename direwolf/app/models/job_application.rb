class JobApplication < ActiveRecord::Base
  belongs_to :job
  validates :job_id, :presence =>true
  validates :employer_id, :presence =>true
  validates :seeker_id, :presence =>true
  validates :status_id, :presence =>true
end
