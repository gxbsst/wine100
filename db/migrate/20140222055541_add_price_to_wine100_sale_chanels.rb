class AddPriceToWine100SaleChanels < ActiveRecord::Migration
  def change
    add_column :wine100_sale_chanels, :price, :float
  end
end
