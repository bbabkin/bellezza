class AddMoreToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :code2, :string
  	add_column :products, :volume3, :integer
  	add_column :products, :code3, :string
  end
end
