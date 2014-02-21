class CreateWine100Wines < ActiveRecord::Migration
  def change
    create_table :wine100_wines do |t|
      t.string :photo
      t.string :style
      t.string :name_zh
      t.string :name_en
      t.string :region_1
      t.string :region_2
      t.string :region_3
      t.string :vintage
      t.string :alcoholicity
      t.float :market_price
      t.string :winery_zh
      t.string :winery_en
      t.string :level
      t.string :sweetness
      t.string :barcode
      t.boolean :is_oak, :default => true
      t.text :prize_history

      t.timestamps
    end
  end
end
