class Wine100::SaleChanel < ActiveRecord::Base
	set_table_name :wine100_sale_chanels
  attr_accessible :chanel, :wine100_wine_id
  belongs_to :wine, :class_name => 'Wine100::Wine', :inverse_of => :sale_chanels
end
