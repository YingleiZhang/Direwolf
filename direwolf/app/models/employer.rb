class Employer < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence =>true
  validates :company_name, :presence =>true
  validates :email, :presence =>true

  def self.search(search)
    find(:all, :conditions => [ 'UPPER(company_name) LIKE ?', "%#{search.upcase}%" ])
  end

end
