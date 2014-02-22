class AddOwnerIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :owner_id, :integer
  end
end
