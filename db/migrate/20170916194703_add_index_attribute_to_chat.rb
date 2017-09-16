class AddIndexAttributeToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :index, :integer
  end
end
