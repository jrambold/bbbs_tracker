class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.text :big
      t.text :little
      t.text :guardian
      t.date :start
      t.timestamps
    end
  end
end
