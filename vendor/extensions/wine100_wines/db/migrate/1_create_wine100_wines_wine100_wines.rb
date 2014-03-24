class CreateWine100WinesWine100Wines < ActiveRecord::Migration

  def up
    create_table :refinery_wine100_wines do |t|
      t.integer :photo_id
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
      t.boolean :is_oak
      t.text :prize_history
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-wine100_wines"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/wine100_wines/wine100_wines"})
    end

    drop_table :refinery_wine100_wines

  end

end
