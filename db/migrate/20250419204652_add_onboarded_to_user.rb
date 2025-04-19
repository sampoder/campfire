class AddOnboardedToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :onboarded, :boolean, null: false, default: false
  end
end
