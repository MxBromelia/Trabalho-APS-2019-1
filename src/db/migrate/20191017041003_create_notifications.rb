class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :message, null: false
      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
