class ReplyBelongsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :post_id, :integer
  end
end
