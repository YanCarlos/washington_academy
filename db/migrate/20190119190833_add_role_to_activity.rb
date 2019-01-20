class AddRoleToActivity < ActiveRecord::Migration
  def change
    create_table(:activities_roles, :id => false) do |t|
      t.references :activity
      t.references :role
    end
    
    add_index(:activities_roles, [ :activity_id, :role_id ])
  end
end
