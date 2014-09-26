class Seeker < ActiveRecord::Base
  belongs_to :user

  validates :email, :presence =>true
  validates :phone, :presence =>true

  acts_as_taggable_on :skills, :applications
end
