class CreateUserContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_contacts do |t|
      t.references :contact, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
