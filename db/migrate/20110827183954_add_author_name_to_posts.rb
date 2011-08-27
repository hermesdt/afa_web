class AddAuthorNameToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :author_name, :string
  end

  def self.down
    remove_column :posts, :author_name
  end
end
