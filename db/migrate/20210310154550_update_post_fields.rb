class UpdatePostFields < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :date
    add_column :posts, :title, :string
  end
end
