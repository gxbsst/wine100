module Refinery
  module Wine100Wines
    class Wine100Wine < ::Wine100::Wine
      self.table_name = 'wine100_wines'

      attr_accessible :photo_id, :style, :name_zh, :name_en, :region_1, :region_2, :region_3, :vintage, :alcoholicity, :market_price, :winery_zh, :winery_en, :level, :sweetness, :is_oak, :prize_history, :position

      acts_as_indexed :fields => [:style, :name_zh, :name_en, :region_1, :region_2, :region_3, :vintage, :alcoholicity, :winery_zh, :winery_en, :level, :sweetness, :prize_history]

      validates :style, :presence => true, :uniqueness => true

      belongs_to :image, :foreign_key => 'photo_id'

    end
  end
end
