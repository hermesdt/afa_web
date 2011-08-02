class CreatePlugins < ActiveRecord::Migration
  def self.up
    create_table :plugins do |t|
      t.string :name
      t.string :os
      t.integer :category_id
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :plugins
  end
end
