class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :reciever, null: false, foreign_key: { to_table: :users }
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
