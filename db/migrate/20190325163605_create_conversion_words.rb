class CreateConversionWords < ActiveRecord::Migration[5.2]
  def change
    create_table :conversion_words do |t|
      t.string :name
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
