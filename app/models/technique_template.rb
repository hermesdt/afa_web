class TechniqueTemplate < ActiveRecord::Base
  belongs_to :technique
  validates :name, :presence => true

  has_many :technique_template_fields
  has_many :template_fields, :through => :technique_template_fields

  def tech_attr_value(attr)
    fields = self.template_fields

    return true if fields.count == 0

    for field in fields
      return true if field.tech_col_name == attr
    end

    return false
  end
end
