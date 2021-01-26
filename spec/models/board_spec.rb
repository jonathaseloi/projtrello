require 'rails_helper'

RSpec.describe Board, :type => :model do

	it 'Tem nome' do
		board = Board.new(name: '')

		expect(board).to_not be_valid

		board.name = 'name'
		expect(board).to be_valid
	end

	it 'O nome tem pelo menos 3 letras' do
		board = Board.new(name: 'na')

		expect(board).to_not be_valid

		board.name = 'name'
		expect(board).to be_valid
	end
end