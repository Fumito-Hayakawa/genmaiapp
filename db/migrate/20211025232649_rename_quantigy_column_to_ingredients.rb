class RenameQuantigyColumnToIngredients < ActiveRecord::Migration[6.1]
  def change
    rename_column :ingredients, :quantigy, :quantity
  end
end
