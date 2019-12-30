class State < ApplicationRecord
	has_many :addresses
	belongs_to :country
end
