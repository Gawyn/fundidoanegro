class CreateArticulos < ActiveRecord::Migration
  def self.up
    create_table :articulos do |t|
      t.string :title
      t.text :body
      t.integer :especial_id
      t.boolean :portada

      t.timestamps
    end
  end

  def self.down
    drop_table :articulos
  end
end
