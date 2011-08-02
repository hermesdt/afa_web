class CreateTechniqueTemplateFields < ActiveRecord::Migration
  def self.up
    create_table :technique_template_fields do |t|
      t.integer :technique_template_id
      t.integer :template_field_id

      t.timestamps
    end
  end

  def self.down
    drop_table :technique_template_fields
  end
end
