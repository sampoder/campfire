class CreateFacts < ActiveRecord::Migration[8.0]
  def change
    create_table :facts do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.string :question, null: false
      t.string :answer, null: false
    end
  end
end
