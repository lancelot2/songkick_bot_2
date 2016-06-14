class AddPreviousContextToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :previous_context, :jsonb
  end
end
