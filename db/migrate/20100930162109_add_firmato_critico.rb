class AddFirmatoCritico < ActiveRecord::Migration
  def self.up
    add_column :criticos, :firma, :string
  end

  def self.down
    remove_column :criticos, :firma
  end
end
