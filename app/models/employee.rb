class Employee < ApplicationRecord
	belongs_to :designation
	has_many :addresses
	has_many :addresstypes, through: :addresses
end
