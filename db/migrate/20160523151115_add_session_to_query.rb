class AddSessionToQuery < ActiveRecord::Migration
  def change
    add_reference :queries, :session, index: true, foreign_key: true
  end
end
