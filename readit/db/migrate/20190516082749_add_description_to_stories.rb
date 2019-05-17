class AddDescriptionToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :description, :text
  end
end
