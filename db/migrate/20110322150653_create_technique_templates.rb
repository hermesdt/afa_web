class CreateTechniqueTemplates < ActiveRecord::Migration
  def self.up
    create_table :technique_templates do |t|
      t.integer :technique_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :technique_templates
  end
end

