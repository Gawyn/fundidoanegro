class CreateEspecials < ActiveRecord::Migration
  def self.up
    create_table :especials do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :especials
  end
end
