class CreateFilms < ActiveRecord::Migration
  def self.up
    create_table :films do |t|
      t.string :title
      t.integer :year
      t.integer :semanadeestreno

      t.timestamps
    end
  end

  def self.down
    drop_table :films
  end
end
