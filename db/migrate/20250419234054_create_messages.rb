class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :catchup, null: false, foreign_key: true
      t.timestamps
    end
  end
end
