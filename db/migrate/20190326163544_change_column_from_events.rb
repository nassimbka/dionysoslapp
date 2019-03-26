class ChangeColumnFromEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :beginning_hour, :string
    change_column :events, :end_hour, :string
  end
end
