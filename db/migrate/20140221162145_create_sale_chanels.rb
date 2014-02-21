class CreateSaleChanels < ActiveRecord::Migration
  def change
    create_table :wine100_sale_chanels do |t|
      t.string :chanel
      t.integer :wine100_wine_id

      t.timestamps
    end
  end
end
