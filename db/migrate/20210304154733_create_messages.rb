class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :to
      t.integer :from

      t.timestamps
    end
  end
end
