class AddFogotPasswordTokenToWine100Users < ActiveRecord::Migration
  def change
    add_column :wine100_users, :fogot_password_token, :string
    add_column :wine100_users, :fogot_password_created_at, :datetime
  end
end
