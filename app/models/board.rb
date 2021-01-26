class Board < ApplicationRecord
	has_many :columns
	validates :name, :presence => true, length: { minimum: 3 }
end
