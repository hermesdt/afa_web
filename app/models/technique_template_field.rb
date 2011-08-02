class TechniqueTemplateField < ActiveRecord::Base
  belongs_to :technique_template
  belongs_to :template_field

  validates :technique_template_id, :uniqueness => {:scope => :template_field_id}
end
