class AddMsg < ActiveRecord::Migration
  def change
    add_column :sessions, :msg, :string
  end
end
