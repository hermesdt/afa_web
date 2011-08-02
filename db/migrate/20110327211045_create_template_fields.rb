class CreateTemplateFields < ActiveRecord::Migration
  def self.up
    create_table :template_fields do |t|
      t.string :name
      t.string :tech_col_name
      t.string :value
      t.integer :field_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :template_fields
  end
end
