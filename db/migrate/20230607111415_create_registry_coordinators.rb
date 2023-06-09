class CreateRegistryCoordinators < ActiveRecord::Migration[6.0]
  def change
    create_table :registry_coordinators do |t|
      t.integer  :registry_id
      t.integer  :user_id

      t.timestamps
    end
    add_index :registry_coordinators, [:registry_id, :user_id], unique: true
  end
end
