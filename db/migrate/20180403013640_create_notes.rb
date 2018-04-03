class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :comment
      t.timestamps
      t.references :contact, foreign_key: true
    end
  end
end
