class AdduserIdtoCriticayArticulo < ActiveRecord::Migration
  def self.up
    add_column :criticas, :user_id, :integer
    add_column :articulos, :user_id, :integer
  end

  def self.down
    remove_column :criticas, :user_id
    remove_column :articulos, :user_id
  end
end
