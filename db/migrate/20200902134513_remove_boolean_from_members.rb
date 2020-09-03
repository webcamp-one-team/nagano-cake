class RemoveBooleanFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :boolean, :string
  end
end
