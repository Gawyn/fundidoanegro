class CreatePuntuacions < ActiveRecord::Migration
  def self.up
    create_table :puntuacions do |t|
      t.integer :film_id
      t.integer :critico_id
      t.integer :nota

      t.timestamps
    end
  end

  def self.down
    drop_table :puntuacions
  end
end
