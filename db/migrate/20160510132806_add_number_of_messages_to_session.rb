class AddNumberOfMessagesToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :count_messages, :integer
  end
end
