class Addresstype < ApplicationRecord
	has_many :addresses
	has_many :employees, through: :addresses
end
