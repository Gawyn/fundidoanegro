class AddnametoUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_index :users, :name,                :unique => true
  end

  def self.down
    remove_column :users, :name
  end
end
