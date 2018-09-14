class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :name, :string
    add_column :users, :identification, :string
  end
end
