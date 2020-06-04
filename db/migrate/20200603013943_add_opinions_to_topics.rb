class AddOpinionsToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :opinions, :text
  end
end
