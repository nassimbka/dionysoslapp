class AddColumnToVenue < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :photo, :string
  end
end
