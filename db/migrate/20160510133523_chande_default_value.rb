class ChandeDefaultValue < ActiveRecord::Migration
  def change
    change_column :sessions, :count_messages, :integer, default: 0
  end
end
