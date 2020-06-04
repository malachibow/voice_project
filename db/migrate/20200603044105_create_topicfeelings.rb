class CreateTopicfeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :topicfeelings do |t|
      t.references :feeling, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
