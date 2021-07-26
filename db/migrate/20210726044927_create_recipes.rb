class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :tips
      t.text :episode
      t.float :portion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
