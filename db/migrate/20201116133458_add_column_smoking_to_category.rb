class AddColumnSmokingToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :smoking, :boolean
  end
end
