class AddCinemaGenreToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :cinema_genre, :string
  end
end
