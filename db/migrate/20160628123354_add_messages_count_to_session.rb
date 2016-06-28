class AddMessagesCountToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :count, :integer
  end
end
