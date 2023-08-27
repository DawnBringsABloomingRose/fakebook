class CreateGroupMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_members do |t|
      t.references :group, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: { to_table: :users }
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
