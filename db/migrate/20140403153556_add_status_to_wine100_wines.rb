class AddStatusToWine100Wines < ActiveRecord::Migration
  def change
    add_column :wine100_wines, :status, :boolean, :default => false
  end
end
