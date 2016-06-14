class AddPreviousMsg < ActiveRecord::Migration
  def change
    add_column :sessions, :previous_msg, :string
  end
end
