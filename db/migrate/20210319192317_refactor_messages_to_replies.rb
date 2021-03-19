class RefactorMessagesToReplies < ActiveRecord::Migration[6.1]
  def change
    rename_table :messages, :replies
  end
end
