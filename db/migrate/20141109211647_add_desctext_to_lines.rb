class AddDesctextToLines < ActiveRecord::Migration
  def change
  	add_column :lines, :description_text, :text
  end
end
