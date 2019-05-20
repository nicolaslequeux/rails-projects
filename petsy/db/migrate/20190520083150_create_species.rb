class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :name
      t.string :slug
      t.integer :pets_counter

      t.timestamps
    end
  end
end
