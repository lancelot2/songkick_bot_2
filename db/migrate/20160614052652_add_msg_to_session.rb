class AddMsgToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :msg, :string
    add_column :sessions, :previous_message, :string
  end
end
