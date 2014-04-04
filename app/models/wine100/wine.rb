# encoding: utf-8
class Wine100::Wine < Refinery::Core::BaseModel
	set_table_name :wine100_wines
  attr_accessible :alcoholicity, :barcode, :is_oak, :level, :market_price, :name_en, :name_zh, :photo, :prize_history, :region_1, :region_2, :region_3, :style, :sweetness, :vintage, :winery_en, :winery_zh, :varieties_attributes, :sale_chanels_attributes, :photo_id
  has_many :varieties, :class_name => 'Wine100::Variety', :foreign_key => 'wine100_wine_id', :dependent => :destroy
  has_many :sale_chanels, :class_name => 'Wine100::SaleChanel', :foreign_key => 'wine100_wine_id', :dependent => :destroy
  accepts_nested_attributes_for :varieties, :allow_destroy => true, :reject_if => proc {|attributes| attributes['name_en'].blank? }
  accepts_nested_attributes_for :sale_chanels, :allow_destroy => true, :reject_if => proc {|attributes| attributes['chanel'].blank? }

  mount_uploader :photo, ::PhotoUploader

  belongs_to :user, :class_name => 'Wine100::User', :foreign_key => 'wine100_user_id'#, :inverse_of => 'wines'
  belongs_to :image, :foreign_key => 'photo_id'

  delegate :profile, :to => :user

  def region
   "#{region_1} - #{region_2} - #{region_3}" 
  end

  def winery_name
    "#{winery_zh} - #{winery_en}" 
  end

  def name
  	"#{vintage} #{name_zh} #{name_en}"
  end

  def varieties_text
    return "无" if !varieties.present?
    varieties.map do |v|
      "#{v.name_en} - #{v.percentage}"
    end.join(";")
  end

  def spec
  	"酒精度: #{alcoholicity}"
  end

  def completed!
    self.update_attribute(:status, true)
  end

  # Profile
  def company_name
    profile.company_name_zh
  end 

end
