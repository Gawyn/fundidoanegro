class AddAutors < ActiveRecord::Migration
  def self.up
    add_column :criticas, :autor, :string
    add_column :especials, :autor, :string
    add_column :articulos, :autor, :string
  end

  def self.down
    remove_column :criticas, :autor
    remove_column :especials, :autor
    remove_column :articulos, :autor
  end
end
