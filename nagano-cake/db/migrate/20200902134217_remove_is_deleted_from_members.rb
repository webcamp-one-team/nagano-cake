class RemoveIsDeletedFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :is_deleted, :string
  end
end
