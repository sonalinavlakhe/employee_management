class Address < ApplicationRecord
	belongs_to :employee
	belongs_to :addresstype
	belongs_to :country
	belongs_to :state
end
