class AddOAuthToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :oauth_id, :string
  end
end
