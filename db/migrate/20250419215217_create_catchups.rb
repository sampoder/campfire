class CreateCatchups < ActiveRecord::Migration[8.0]
  def change
    create_table :catchups do |t|
      t.references :contact, null: false, foreign_key: true
      t.string :prompt, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
