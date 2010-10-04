class Addimages < ActiveRecord::Migration
  def self.up
    add_column :especials, :image_file_name, :string
    add_column :especials, :image_content_type, :string
    add_column :especials, :image_file_size, :integer
    add_column :especials, :image_updated_at, :datetime
    add_column :criticas, :image_file_name, :string
    add_column :criticas, :image_content_type, :string
    add_column :criticas, :image_file_size, :integer
    add_column :criticas, :image_updated_at, :datetime
    add_column :articulos, :image_file_name, :string
    add_column :articulos, :image_content_type, :string
    add_column :articulos, :image_file_size, :integer
    add_column :articulos, :image_updated_at, :datetime
  end

  def self.down
    remove_column :criticas, :image_file_name
    remove_column :criticas, :image_content_type
    remove_column :criticas, :image_file_size
    remove_column :criticas, :image_updated_at
    remove_column :especials, :image_file_name
    remove_column :especials, :image_content_type
    remove_column :especials, :image_file_size
    remove_column :especials, :image_updated_at
    remove_column :articulos, :image_file_name
    remove_column :articulos, :image_content_type
    remove_column :articulos, :image_file_size
    remove_column :articulos, :image_updated_at
  end
end
