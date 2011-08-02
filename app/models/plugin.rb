class Plugin < ActiveRecord::Base
  has_many :techniques, :dependent => :destroy
  belongs_to :category

  has_many :plugin_tags, :dependent => :destroy
  has_many :tags, :through => :plugin_tags

  validates :category_id, :presence => true
  validates :name, :uniqueness => {:scope => :category_id}, :presence => true

  validates_format_of :name, :with => /\A[a-zA-Z_\-0-9]*\Z/, :message => " is not correct. Only letters, numbers, '_' and '-'."
  validates_format_of :os, :with => /\A[a-zA-Z_\-0-9]*\Z/, :message => " is not correct. Only letters, numbers, '_' and '-'."
  validates_format_of :author, :with => /\A[a-zA-Z_\-0-9]*\Z/, :message => " is not correct. Only letters, numbers, '_' and '-'."

  validates :os, :presence => true
  validates :author, :presence => true

end
