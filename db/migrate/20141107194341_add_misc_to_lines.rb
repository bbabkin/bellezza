class AddMiscToLines < ActiveRecord::Migration
  def change
  	add_column :lines, :banner, :string
  	add_column :lines, :banner2, :string
  	add_column :lines, :logo, :string
  	add_column :lines, :category, :string
  	add_index :lines, :category
  end
end
