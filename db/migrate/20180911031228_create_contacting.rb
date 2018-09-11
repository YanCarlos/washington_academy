class CreateContacting < ActiveRecord::Migration
  def change
    create_table :contactings do |t|
      t.string :name
      t.string :phone
      t.string :message
    end
  end
end
