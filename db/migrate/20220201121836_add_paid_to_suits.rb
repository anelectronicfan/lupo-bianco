class AddPaidToSuits < ActiveRecord::Migration[5.2]
  def change
    add_column :suits, :paid, :boolean
  end
end
