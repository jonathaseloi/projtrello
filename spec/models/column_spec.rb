require 'rails_helper'

RSpec.describe Column, :type => :model do

	let(:board) { Board.new(id: '1', name: 'board') }

	it 'Tem nome' do
		coluna = Column.new(name: '')
		coluna.board = board
		expect(coluna).to_not be_valid

		coluna.name = 'name'
		expect(coluna).to be_valid
	end

	it 'O nome tem pelo menos 3 letras' do
		coluna = Column.new(name: 'na')
		coluna.board = board
		expect(coluna).to_not be_valid

		coluna.name = 'name'
		expect(coluna).to be_valid
	end

	it 'Estar ligada a um Board' do
		coluna = Column.new(name: 'name')
		expect(coluna).to_not be_valid

		coluna.board = board
		expect(coluna).to be_valid
	end
end