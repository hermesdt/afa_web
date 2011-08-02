class AddMimetypeToTechniques < ActiveRecord::Migration
  def self.up
    add_column :techniques, :mimetype, :string
  end

  def self.down
    remove_column :techniques, :mimetype
  end
end
