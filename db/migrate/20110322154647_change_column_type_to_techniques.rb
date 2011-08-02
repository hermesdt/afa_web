class ChangeColumnTypeToTechniques < ActiveRecord::Migration
  def self.up
    change_column :techniques, :technique_type_id, :integer, :default => 1
  end

  def self.down
  end
end
