class RemoveBrewerModel < ActiveRecord::Migration
  def change
    remove_column :batches, :brewer_id
    add_column :batches, :user_id, :integer
    add_index :batches, :user_id
    drop_table :brewers
  end
end
