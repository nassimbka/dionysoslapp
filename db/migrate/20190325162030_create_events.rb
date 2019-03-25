class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :price
      t.string :name
      t.string :category
      t.date :date
      t.time :beginning_hour
      t.time :end_hour
      t.text :description
      t.references :venue, foreign_key: true
      t.string :url
      t.string :picture

      t.timestamps
    end
  end
end
