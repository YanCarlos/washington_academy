class CreateWorkShop < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.references :group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :content
      t.decimal :percentage, default: 0.0
      t.date :deadline

      t.timestamps
    end
  end
end
