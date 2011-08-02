class AddDescriptionToPlugins < ActiveRecord::Migration
  def self.up
    add_column :plugins, :description, :text
  end

  def self.down
    remove_column :plugins, :description
  end
end
