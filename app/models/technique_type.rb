class TechniqueType < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates_format_of :name, :with => /\A[a-zA-Z_\-0-9]*\Z/, :message => " format is not correct. Only letters, numbers, '_' and '-'."
end
