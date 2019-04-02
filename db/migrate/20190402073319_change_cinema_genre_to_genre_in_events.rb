class ChangeCinemaGenreToGenreInEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :cinema_genre, :genre
  end
end
