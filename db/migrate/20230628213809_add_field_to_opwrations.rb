class AddFieldToOpwrations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :otype, :string
  end
end
