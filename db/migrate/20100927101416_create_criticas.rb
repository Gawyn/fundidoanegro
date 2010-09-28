class CreateCriticas < ActiveRecord::Migration
  def self.up
    create_table :criticas do |t|
      t.string :title
      t.text :body
      t.string :title_film
      t.string :director
      t.integer :year
      t.string :country
      t.integer :nota
      t.boolean :portada

      t.timestamps
    end
  end

  def self.down
    drop_table :criticas
  end
end
