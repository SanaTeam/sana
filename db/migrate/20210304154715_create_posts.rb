class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.boolean :pinned
      t.boolean :is_anonymous
      t.datetime :date

      t.timestamps
    end
  end
end
