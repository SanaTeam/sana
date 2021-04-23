class AddPostCategories < ActiveRecord::Migration[6.1]
  def change
      add_column :posts, :categories, :text, array: true, default: []
  end
end
