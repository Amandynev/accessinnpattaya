class TranslateCategories < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        Category.create_translation_table!({ 
          name: :string,
          description: :string,
          bed_size: :string 
        }, { 
          migrate_data: true 
        })
      end

      dir.down do
        Category.drop_translation_table! migrate_data: true
      end
    end
  end
end
