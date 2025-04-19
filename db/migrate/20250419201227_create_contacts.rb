class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.timestamps
    end

    # Create a join table to establish the many-to-many relationship between contacts and users.
    # `id: false` indicates that the table does not need a primary key of its own
    create_table :contacts_users, id: false do |t|
      t.belongs_to :contact
      t.belongs_to :user
    end
  end
end