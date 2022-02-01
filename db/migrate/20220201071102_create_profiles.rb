class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :name
      t.text :gender
      t.integer :height
      t.integer :weight
      t.integer :shoulders
      t.integer :neck
      t.integer :chest
      t.integer :bicep
      t.integer :forearm
      t.integer :wrist
      t.integer :sleeve
      t.integer :front_length
      t.integer :back_length
      t.integer :mid_waist
      t.integer :waist
      t.integer :hip
      t.integer :upper_thigh
      t.integer :middle_thigh
      t.integer :calf
      t.integer :ankle
      t.integer :pants_length
      t.integer :crotch

      t.timestamps
    end
  end
end
