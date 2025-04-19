class AddShortToSession < ActiveRecord::Migration[8.0]
  def change
    add_column :sessions, :short, :integer, null: false
  end
end
