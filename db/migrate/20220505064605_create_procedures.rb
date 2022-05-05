class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.integer :recipe_id
      t.text :how_to_use
      t.integer :number

      t.timestamps
    end
  end
end
