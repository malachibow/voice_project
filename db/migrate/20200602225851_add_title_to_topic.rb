class AddTitleToTopic < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :title, :text
  end
end
