class AddOrderToSession < ActiveRecord::Migration
  def change
    add_reference :sessions, :order, index: true, foreign_key: true
  end
end
