class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.string :autor
      t.integer :articulo_id
      t.integer :critica_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
