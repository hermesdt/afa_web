class CreateFieldValues < ActiveRecord::Migration
  def self.up
    create_table :field_values do |t|
      t.string :value
      t.integer :template_field_id

      t.timestamps
    end
  end

  def self.down
    drop_table :field_values
  end
end
