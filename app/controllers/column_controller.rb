class ColumnController < ApplicationController
	
	before_action :set_column, only: [:edit, :update]

	def index
		@columns = Columns.all
	end

	def delete
		@column = Column.find(params[:id])
		@columns = Column.where(:board_id => @column.board_id)
		@board = Board.find(@column.board_id)
		if @column.destroy
			redirect_to show_board_path(@column.board_id), alert: "Coluna excluido com sucesso!"
		else
			redirect_to show_board_path(@column.board_id), alert: "A coluna nao foi excluida."
		end
	end

	def get
		@column = Column.find(params[:id])

		render 'column/modal'
	end
	
	def createtitle
	  	@column = Column.new(column_params)
	  	@column.board_id = params[:id]
		@columns = Column.where(:board_id => @column.board_id)
		@boards = Board.all
		@board = Board.find(params[:id])
		@columns = Column.all

	  	if @column.save
	  		redirect_to show_board_path, alert: "Coluna criada com sucesso!"
	  	else
	  		redirect_to show_board_path, alert: "Coluna excluida sem sucesso!"
	  	end
	end

	def edit
		@boards = Board.all
		@columns = Column.all
		@board = Board.find(@column.board_id)

		if @column.update(name: params[:column][:name])
			redirect_to show_board_path(@board.id), alert: "Coluna editada com sucesso!"
		else
			redirect_to show_board_path(@board.id), alert: "Coluna não foi editada com sucesso!"
		end
	end

	def move
		@column = Column.find(params[:id])
		@column.insert_at(params[:position].to_i)
		head :ok
	end

	private

	def set_column
		@column = Column.find(params[:id])
	end

	def column_params
		params.require(:column).permit(:id, :name, :board_id)
	end
end
