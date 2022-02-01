class AddMoneyToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :money, :integer
  end
end
