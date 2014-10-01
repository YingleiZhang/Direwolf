class Job < ActiveRecord::Base
  belongs_to :category
  has_many :applications
  validates :title, :presence=>true
  validates :employer_id, :presence=>true
  validates :category_id, :presence=>true
  acts_as_taggable

  def self.search(search)
    find(:all, :conditions => ['UPPER(title) LIKE ? OR UPPER(description) LIKE ?', "%#{search.upcase}%", "%#{search.upcase}%" ])
  end

  def expired?
    return DateTime.now > self.expires_at
  end

  def ustime
    self.expires_at.strftime('%m/%d/%Y %I:%M %p')
  end

  def employer_name
    Employer.find(employer_id).company_name
  end

  def self.utctime ustime
    DateTime.strptime(ustime, '%m/%d/%Y %I:%M %p').to_s
  end

end
