class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :number
      t.date :expiration_date
      t.string :cvv
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
