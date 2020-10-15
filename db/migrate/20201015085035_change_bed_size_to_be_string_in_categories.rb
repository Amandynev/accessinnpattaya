class ChangeBedSizeToBeStringInCategories < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :bed_size, :string
  end
end
