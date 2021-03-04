class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :organization_id
      t.string :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
