class Chat < ApplicationRecord
  after_create :add_title
  has_many :messages
  belongs_to :user1, class_name: 'User'
	belongs_to :user2, class_name: 'User'
	validates :user1, :user2, presence: true
  validates :index, presence: true, uniqueness: true
  
	private
    
    def add_title
      self.title = "#{self.user1.name}/#{self.user2.name}"
      self.save
    end
    
end