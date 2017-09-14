class Chat < ApplicationRecord
	validates :user1, :user2, presence: true
end