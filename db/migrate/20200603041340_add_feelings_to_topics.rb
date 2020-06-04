class AddFeelingsToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :feelings, :string
  end
end
