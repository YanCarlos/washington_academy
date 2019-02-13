class AddSeenToContacting < ActiveRecord::Migration
  def change
    add_column :contactings, :seen, :boolean, default: false
  end
end
