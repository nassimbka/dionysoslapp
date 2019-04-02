class AddGenreToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :genre, :string
  end
end
