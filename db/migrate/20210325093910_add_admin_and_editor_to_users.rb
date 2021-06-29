class AddAdminAndEditorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :editor, :boolean
  end
end
