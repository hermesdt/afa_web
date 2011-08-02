class TemplateField < ActiveRecord::Base
  belongs_to :field_category

  validates :field_category_id, :name, :tech_col_name, :presence => true
  validates :name, :uniqueness => {:case_sensitive => false}

  has_many :technique_template_fields
  has_many :technique_templates, :through => :technique_template_fields

  has_many :field_values, :dependent => :destroy

  def join_values
    values = []
    self.field_values.each{ |val|
      values << val.value
    }

    values.join(", ")
  end

  def to_json
    """{
      'id': '#{self.id}',
      'name': '#{self.name}',
      'tech_col_name': '#{self.tech_col_name }',
        'values': [
            #{self.join_values_with_quot_and_id}
              ]
    }
    """
  end

protected

  def join_values_with_quot_and_id
    values = []
    self.field_values.each{ |val|
      values << "{'id': '"+val.id.to_s+"', 'value': '"+val.value+"'}"
    }

    values.join(", ")
  end

end

