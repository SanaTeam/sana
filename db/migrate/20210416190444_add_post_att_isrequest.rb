class AddPostAttIsrequest < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_request, :boolean
  end
end
