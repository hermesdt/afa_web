class FieldValue < ActiveRecord::Base

  belongs_to :template_field

  validates :value, :presence => true
  validates :template_field_id, :presence => true
  validates :template_field_id, :uniqueness => {:scope => :value}

end

