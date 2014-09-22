class Job < ActiveRecord::Base
  belongs_to :category
  has_many :applications
  validates :title, :presence=>true
  validates :employer_id, :presence=>true
  validates :category_id, :presence=>true
  acts_as_taggable
end
