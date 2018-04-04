class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :big_little
      t.date :contact_due
      t.string :person
      t.date :sor
      t.date :yos
      t.boolean :training
      t.date :driving
      t.timestamps
      t.references :match, foreign_key: true
    end
  end
end
