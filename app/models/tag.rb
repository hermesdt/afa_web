class Tag < ActiveRecord::Base
  has_many :plugin_tags
  has_many :plugins, :through => :plugin_tags

  validates :name, :presence => true, :uniqueness => true
  validates_format_of :name, :with => /\A[a-zA-Z_\-0-9]*\Z/, :message => " format is not correct. Only letters, numbers, '_' and '-'."
end
