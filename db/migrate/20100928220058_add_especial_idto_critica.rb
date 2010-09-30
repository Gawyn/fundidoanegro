class AddEspecialIdtoCritica < ActiveRecord::Migration
  def self.up
    add_column :criticas, :especial_id, :integer
  end

  def self.down
    remove_column :criticas, :especial_id
  end
end
