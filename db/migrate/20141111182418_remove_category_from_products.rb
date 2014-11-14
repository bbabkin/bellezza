class RemoveCategoryFromProducts < ActiveRecord::Migration
  def up
  	remove_column :products, :category
  end
  def down
  	add_column :products, :category, :string
  	add_index :products, :category
  end
end
