class CreateSuits < ActiveRecord::Migration[5.2]
  def change
    create_table :suits do |t|
      t.text :design
      t.text :jacket_fit
      t.text :pants_fit
      t.text :jacket_pocket_style
      t.integer :jacket_pockets
      t.integer :jacket_buttons
      t.text :inner_lining_color
      t.integer :vents
      t.text :lapel
      t.text :inner_lining_name
      t.boolean :shirt_chest_pocket
      t.text :shirt_collar
      t.text :shirt_cuff
      t.text :shirt_initials
      t.integer :shirt_length
      t.integer :shirt_sleeve_length
      t.integer :extra_shirts
      t.integer :extra_pants
      t.integer :extra_jackets
      t.integer :quality
      t.integer :price
      t.text :notes

      t.timestamps
    end
  end
end
