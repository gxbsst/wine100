class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :wine100_varieties do |t|
      t.string :culture
      t.string :name_zh
      t.string :name_en
      t.string :pinyin
      t.string :origin_name
      t.string :percentage
      t.integer :wine100_wine_id

      t.timestamps
    end
  end
end
