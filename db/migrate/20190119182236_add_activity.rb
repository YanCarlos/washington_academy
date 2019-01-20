class AddActivity < ActiveRecord::Migration
  def change
    drop_table :workshops
    create_table :activities do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :content
      t.decimal :percentage, default: 0.0
      t.datetime :deadline

      t.timestamps
    end
  end
end
