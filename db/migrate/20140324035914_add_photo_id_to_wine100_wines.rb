class AddPhotoIdToWine100Wines < ActiveRecord::Migration
  def change
    add_column :wine100_wines, :photo_id, :integer
  end
end
