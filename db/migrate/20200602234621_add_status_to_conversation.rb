class AddStatusToConversation < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :status, :integer
  end
end
