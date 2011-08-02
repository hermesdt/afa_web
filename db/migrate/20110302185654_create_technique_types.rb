class CreateTechniqueTypes < ActiveRecord::Migration
  def self.up
    create_table :technique_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :technique_types
  end
end
