class AddnametoAdmin < ActiveRecord::Migration
  def self.up
    add_column :admins, :name, :string
    add_index :admins, :name,                :unique => true
  end

  def self.down
    remove_column :admins, :name
  end
end
