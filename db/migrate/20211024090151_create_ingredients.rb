class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :recipe_id
      t.string :quantigy

      t.timestamps
    end
  end
end
