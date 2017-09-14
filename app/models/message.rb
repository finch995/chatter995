class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  default_scope { order(created_at: :asc) }
  validates :content, :user_id, presence: true
end