class AddCreatedAtToContacting < ActiveRecord::Migration
  change_table :contactings do |t|
    t.timestamps
  end
end
