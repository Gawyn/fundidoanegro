class DeviseCreateCriticos < ActiveRecord::Migration
  def self.up
    create_table(:criticos) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_column :criticos, :name, :string
    add_index :criticos, :email,                :unique => true
    add_index :criticos, :reset_password_token, :unique => true
    add_index :criticos, :name,                :unique => true
    # add_index :criticos, :confirmation_token,   :unique => true
    # add_index :criticos, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :criticos
  end
end
