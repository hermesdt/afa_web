class CreateTechniques < ActiveRecord::Migration
  def self.up
    create_table :techniques do |t|
      t.string :filename
      t.string :location
      t.integer :technique_type_id
      t.integer :plugin_id
      t.boolean :recursively
      t.string :hash_type
      t.string :hash_value
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :techniques
  end
end
