class AddOrganizationIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :organization_id, :integer
  end
end
