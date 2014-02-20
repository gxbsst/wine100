class CreateTableWine100User < ActiveRecord::Migration
  def up
    create_table :wine100_users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :password_cleartext
      t.integer :builder_id
      t.datetime :last_sign_in_at
      t.datetime :remember_created_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.string :phone

      t.boolean :is_completed, default: false

      t.timestamps
    end

  end

  def down
    
    drop_table :wine100_users

  end
end
