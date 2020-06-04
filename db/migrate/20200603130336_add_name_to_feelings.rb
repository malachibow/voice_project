class AddNameToFeelings < ActiveRecord::Migration[6.0]
  def change
    add_column :feelings, :name, :string
  end
end
