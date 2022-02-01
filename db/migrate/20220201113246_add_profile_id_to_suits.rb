class AddProfileIdToSuits < ActiveRecord::Migration[5.2]
  def change
    add_column :suits, :profile_id, :integer
  end
end
