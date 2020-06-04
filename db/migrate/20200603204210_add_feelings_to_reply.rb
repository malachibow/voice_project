class AddFeelingsToReply < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :feelings, :string
  end
end
