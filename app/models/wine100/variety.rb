class Wine100::Variety < ActiveRecord::Base
	set_table_name :wine100_varieties
  attr_accessible :culture, :name_en, :name_zh, :origin_name, :percentage, :pinyin, :wine100_wine_id
  belongs_to :wine, :class_name => 'Wine100::Wine', :inverse_of => :varieties
end
