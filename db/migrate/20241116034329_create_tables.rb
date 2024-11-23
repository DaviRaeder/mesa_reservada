class CreateTables < ActiveRecord::Migration[7.1]
  def change
    create_table :tables do |t|
      t.string :identifier
      t.integer :capacity
      t.string :status

      t.timestamps
    end
  end
end
