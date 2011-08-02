class AddColumnFieldValueIdToTechniqueTemplateField < ActiveRecord::Migration
  def self.up
    add_column :technique_template_fields, :field_value_id, :integer
  end

  def self.down
    remove_column :technique_template_fields, :field_value_id
  end
end
