class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :image_url
      t.string :cuisine_type
      t.decimal :price

      t.timestamps
    end
  end
end
