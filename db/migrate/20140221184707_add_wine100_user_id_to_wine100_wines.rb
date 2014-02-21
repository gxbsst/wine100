class AddWine100UserIdToWine100Wines < ActiveRecord::Migration
  def change
    add_column :wine100_wines, :wine100_user_id, :integer
  end
end
