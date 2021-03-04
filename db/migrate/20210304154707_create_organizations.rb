class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :org_type
      t.boolean :accepts_donations
      t.string :location

      t.timestamps
    end
  end
end
