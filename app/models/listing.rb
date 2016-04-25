class Listing < ActiveRecord::Base 
validates :title, presence: true
validates :title, length: {maximum: 150}
has_many :picture, dependent: :destroy 
end