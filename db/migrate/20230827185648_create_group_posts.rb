class CreateGroupPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :group_posts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
