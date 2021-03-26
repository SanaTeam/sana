class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :post_id
      t.integer :user1_id
      t.integer :user2_id
      t.boolean :user1_confirmed
      t.boolean :user2_confirmed
      t.timestamps
    end
  end
end
