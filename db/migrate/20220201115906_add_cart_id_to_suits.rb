class AddCartIdToSuits < ActiveRecord::Migration[5.2]
  def change
    add_column :suits, :cart_id, :integer
  end
end
