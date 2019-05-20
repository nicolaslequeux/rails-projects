class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender, length: 1
      t.date :birthday
      t.references :user, foreign_key: true
      t.references :species, foreign_key: true

      t.timestamps
    end
  end
end
