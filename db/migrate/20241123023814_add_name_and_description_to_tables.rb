class AddNameAndDescriptionToTables < ActiveRecord::Migration[7.1]
  def change
    add_column :tables, :description, :text
  end
end
