class RemoveValueFromTemplateFields < ActiveRecord::Migration
  def self.up
    remove_column :template_fields, :value
  end

  def self.down
    add_column :template_fields, :value, :string
  end
end

