class CreatePluginTags < ActiveRecord::Migration
  def self.up
    create_table :plugin_tags do |t|
      t.integer :plugin_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :plugin_tags, [:plugin_id, :tag_id], :unique => true
  end

  def self.down
    remove_index :plugin_tags, :column => [:plugin_id, :tag_id]
    drop_table :plugin_tags
  end
end
