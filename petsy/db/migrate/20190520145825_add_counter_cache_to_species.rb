class AddCounterCacheToSpecies < ActiveRecord::Migration[5.2]
  def change
    add_column :species, :pets_count, :integer
  end
end
