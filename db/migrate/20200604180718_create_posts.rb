class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :stand
      t.text :why
      t.bigint :reply_to
      t.boolean :agree
      t.references :user, null: false, foreign_key: true
      t.boolean :change_stand

      t.timestamps
    end
  end
end
