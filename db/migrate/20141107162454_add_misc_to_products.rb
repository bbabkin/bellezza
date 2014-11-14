class AddMiscToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :skin_type, :text
  	add_column :products, :use, :text
  	add_column :products, :volume2, :integer
  	add_column :products, :contents, :text
  	add_column :products, :special_price, :integer
  	add_column :products, :note, :text
  	add_column :products, :code, :string
  	add_column :products, :banner, :string
  end
end
