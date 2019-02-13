class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :title
      t.integer :likes
      t.string :img_url

      t.timestamps
    end
  end
end
