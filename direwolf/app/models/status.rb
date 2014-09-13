class Status < ActiveRecord::Base
  validates :title, :presence=>true
end
