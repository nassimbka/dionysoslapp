class AddPhotoUrlToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :photo_url, :string
  end
end
