class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.text :note
      t.string :banner
      t.integer :position
			t.boolean :visible, :default => true
			t.string :permalink
      t.timestamps
    end
  end
end
