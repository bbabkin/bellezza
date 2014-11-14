class AddPriceToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :price2, :integer
  	add_column :products, :special_price2, :integer
  	add_column :products, :price3, :integer
  	add_column :products, :special_price3, :integer
  	add_column :products, :special_good_thru, :datetime
  	add_column :products, :special_start, :datetime
  end
end
