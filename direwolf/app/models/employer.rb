class Employer < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence =>true
  validates :company_name, :presence =>true
  validates :email, :presence =>true
end
