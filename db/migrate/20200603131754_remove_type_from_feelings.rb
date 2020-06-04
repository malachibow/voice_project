class RemoveTypeFromFeelings < ActiveRecord::Migration[6.0]
  def change
    remove_column :feelings, :type, :string
  end
end
