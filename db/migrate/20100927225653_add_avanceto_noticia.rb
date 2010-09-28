class AddAvancetoNoticia < ActiveRecord::Migration
  def self.up
    add_column :noticias, :avance, :text
  end

  def self.down
    remove_column :noticias, :avance
  end
end
