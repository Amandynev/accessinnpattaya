class ChangePriceToRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :price
    add_monetize :categories, :price, currency: { present: false }
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
