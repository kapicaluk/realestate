class Listing < ActiveRecord::Base 
validates :title, presence: true
belongs_to :user
validates :title, length: {maximum: 150}
has_many :features, dependent: :destroy
has_many :picture, dependent: :destroy 
end