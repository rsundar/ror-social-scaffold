class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user_id, null: false, foreign_key: { to_table: :users }
      t.references :friend_id, null: false, foreign_key: { to_table: :users}
      t.string :status

      t.timestamps
    end
  end
end
