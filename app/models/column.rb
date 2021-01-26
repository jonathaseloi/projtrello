class Column < ApplicationRecord
	acts_as_list
	belongs_to :board
	has_many :cards
	validates :name, :presence => true, length: { minimum: 3 }
	validates :board_id, :presence => true
end
