class CardController < ApplicationController

	def index
  		@cards = Card.all
	end

	def getcolumn
		@column = Column.find(params[:id])

		render 'card/modal'
	end

	def get
		@card = Card.find(params[:id])

		render 'card/modaledit'
	end

	def modalshow
		@card = Card.find(params[:id])

		render 'card/modalshow'
	end

	def show
		@column = Column.find(params[:id])
		@cards = Card.where(:column_id => params[:id])

		render 'card/show'
	end

	def create
		@card = Card.new(card_params)
		@card.column_id = params[:id]
		@boards = Board.all
		@column = Column.find(params[:id])
		@board = Board.find(@column.board_id)
		@columns = Column.all

		if @card.save
			redirect_to show_board_path(@board.id), alert: "Card criado com sucesso!"
		else
			redirect_to show_board_path(@board.id), alert: "Card excluido sem sucesso!"
		end
	end

	def edit
		@card = Card.find(params[:id])
		@boards = Board.all
		@column = Column.find(@card.column_id)
		@columns = Column.where(:board_id => @column.board_id)
		@board = Board.find(@column.board_id)

		if @card.update(card_params)
			redirect_to show_board_path(@board.id), alert: "card editada com sucesso!"
		else
			redirect_to show_board_path(@board.id), alert: "card não foi editada com sucesso!"
		end
	end

	def delete
		@card = Card.find(params[:id])
		@column = Column.find(@card.column_id)
		@columns = Column.where(:board_id => @column.board_id)
		@board = Board.find(@column.board_id)
		
		if @card.destroy
			redirect_to show_board_path(@column.board_id), alert: "card excluido com sucesso!"
		else
			redirect_to show_board_path(@column.board_id), alert: "O card nao foi excluido."
		end
	end

	def move
		@card = Card.find(params[:id])
		@card.column_id = params[:column_id]
		@card.position = params[:position]
		@card.save
		head :ok
	end

	private 

	def card_params
		params.require(:card).permit(:id, :title, :description, :board_id, :position)
	end
end
