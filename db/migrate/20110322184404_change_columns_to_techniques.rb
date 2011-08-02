class ChangeColumnsToTechniques < ActiveRecord::Migration
  def self.up
    change_column :techniques, :recursively, :boolean, :default => false
  end

  def self.down
  end
end
