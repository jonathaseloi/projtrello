class BoardController < ApplicationController
 
 	respond_to :js
	helper_method :show_card

	def new
		@board = Board.find(params[:id])
	end

	def index
		@board = Board.new
		@boards = Board.all
		@columns = Column.all
		
		respond_to do |format|
			format.html { render 'index.html.erb' }
			format.js { render 'index.js.erb' }
      	end
	end

	def show
		@board = Board.find(params[:id])
		@columns = Column.where(:board_id => params[:id])
		render "board"
	end

	def show_card(column_id)
		@column = Column.find(column_id)
		@board = Board.find(params[:id])
		@cards = Card.where(:column_id => @column.id)

		return 'card/show'
	end

	def delete
		@board = Board.find(params[:id])
		@boards = Board.all()
		@columns = Column.where(:board_id => params[:id])
		if @board.destroy
			flash[:notice] = 'Board excluida!'
			redirect_to index_board_path()
		else
			render "board/index"
		end
	end

	def reload
		@columns = Column.where(:board_id => params[:id])
	end

	def create
		@board = Board.new(board_params)
		@boards = Board.all
		@columns = Column.all

		if @board.save
			flash[:notice] = 'Board criado com sucesso!'
			render "board/index"
		else
			flash[:notice] = 'Board não foi criada!'
			render "board/index"
		end
	end

	def get
		@board = Board.find(params[:id])

		render 'board/modaledit'
	end

	def edit
		@board = Board.find(params[:id])
		@board.name = params[:board][:name]
		@boards = Board.all
		@columns = Column.all

		if @board.save
			redirect_to show_board_path(@board.id), alert: "Board editada com sucesso!"
		else
			redirect_to show_board_path(@board.id), alert: "Board não foi editada com sucesso!"
		end
	end

	private

	def board_params
		params.require(:board).permit(:id, :name)
	end
end
