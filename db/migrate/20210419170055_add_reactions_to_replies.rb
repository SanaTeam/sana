class AddReactionsToReplies < ActiveRecord::Migration[6.1]
    def change
      add_column :replies, :like, :integer
      add_column :replies, :dislike, :integer
      add_column :replies, :love, :integer
      add_column :replies, :exclamation, :integer
    end
  end
  