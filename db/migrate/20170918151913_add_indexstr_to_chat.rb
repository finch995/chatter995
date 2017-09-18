class AddIndexstrToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :index_str, :string
  end
end
