class ChangePriceToRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :price
    add_monetize :categories, :price, currency: { present: false }
  end
end
