class Category < ActiveRecord::Base
  has_many :plugins

  validates :name, :uniqueness => true, :presence => true
  validates_format_of :name, :with => /\A[a-zA-Z_\-0-9]*\Z/, :message => " format is not correct. Only letters, numbers, '_' and '-'."
end
