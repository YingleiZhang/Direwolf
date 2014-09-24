class Seeker < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable_on :skills
end
