class AddPhoneNumberColumnToVenue < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :phone_number, :string
  end
end
