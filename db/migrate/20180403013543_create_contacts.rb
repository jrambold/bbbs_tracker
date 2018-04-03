class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :type
      t.date :recent
      t.timestamps
    end
  end
end
