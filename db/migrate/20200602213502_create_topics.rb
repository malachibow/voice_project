class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.text :facts
      t.text :experience

      t.timestamps
    end
  end
end
