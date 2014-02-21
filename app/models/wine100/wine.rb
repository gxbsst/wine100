# encoding: utf-8
class Wine100::Wine < ActiveRecord::Base
	set_table_name :wine100_wines
  attr_accessible :alcoholicity, :barcode, :is_oak, :level, :market_price, :name_en, :name_zh, :photo, :prize_history, :region_1, :region_2, :region_3, :style, :sweetness, :vintage, :winery_en, :winery_zh, :varieties_attributes, :sale_chanels_attributes
  has_many :varieties, :class_name => 'Wine100::Variety', :foreign_key => 'wine100_wine_id', :dependent => :destroy
  has_many :sale_chanels, :class_name => 'Wine100::SaleChanel', :foreign_key => 'wine100_wine_id', :dependent => :destroy
  accepts_nested_attributes_for :varieties, :allow_destroy => true, :reject_if => proc {|attributes| attributes['name_en'].blank? }
  accepts_nested_attributes_for :sale_chanels, :allow_destroy => true, :reject_if => proc {|attributes| attributes['chanel'].blank? }

  mount_uploader :photo, ::PhotoUploader

  belongs_to :user, :class_name => 'Wine100::User', :foreign_key => 'wine100_user_id'#, :inverse_of => 'wines'


  def name
  	"#{vintage} #{name_zh} #{name_en}"
  end

  def spec
  	"酒精度: #{alcoholicity} <br/> 条形码: #{barcode}"
  end
end
