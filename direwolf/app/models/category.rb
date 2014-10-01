class Category < ActiveRecord::Base
  has_many :jobs
  validates :name, :presence => true

  def self.search(search)
    find(:all, :conditions => [ 'UPPER(name) LIKE ?', "%#{search.upcase}%" ])
  end
end
