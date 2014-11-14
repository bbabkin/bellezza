class Category < ActiveRecord::Base
	has_and_belongs_to_many :products
	before_validation :add_default_permalink
	validates_presence_of :name
  validates_length_of :name, :maximum => 255
  # use presence_of with length_of to disallow spaces
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by subject use ":scope => :subject_id"

  # scope :visible, lambda { where(:visible => true) }
  # scope :invisible, lambda { where(:visible => false) }
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order("categories.position ASC")}
  scope :newest_first, lambda { order("categories.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }
  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{id}-#{name.parameterize}"
    end
  end
end