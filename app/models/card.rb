class Card < ApplicationRecord
	acts_as_list
	belongs_to :column
	has_many :check_items
	validates :title, :presence => true
	validates :column_id, :presence => true
end
