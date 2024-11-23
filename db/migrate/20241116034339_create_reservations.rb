class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
