class FixAssociationOnMessages < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :from, :user_id
  end
end
