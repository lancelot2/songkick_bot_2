class AddAttributesToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :attr, :string
    add_column :queries, :value, :string
    remove_column :queries, :brand
    remove_column :queries, :style
    remove_column :queries, :gender
  end
end
