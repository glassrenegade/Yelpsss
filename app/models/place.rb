class Place < ApplicationRecord
	belongs_to :user
	has_many :comments, :dependent => :delete_all
	has_many :photos, :dependent => :delete_all
	
	geocoded_by :address
	after_validation :geocode

	validates :name, presence: true, length: {minimum: 3}
	validates :address, presence: true
	validates :description, presence: true
end
