class FieldCategory < ActiveRecord::Base
  has_many :template_fields

  validates :name, :uniqueness => true
end
