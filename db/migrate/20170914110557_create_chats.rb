class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :user1
      t.references :user2

      t.timestamps
    end
  end
end