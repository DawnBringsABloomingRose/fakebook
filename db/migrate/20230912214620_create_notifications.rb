class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notificable, null: false, polymorphic: true
      t.boolean :seen, null: false, default: false
      t.timestamps
    end
  end
end
