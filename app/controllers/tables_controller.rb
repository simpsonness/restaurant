class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)

    if @table.save
      flash[:notice] = "Plan A Restaurant was saved!"
      redirect_to @table
    else
      flash[:error] = "There was an error saving the restaurant. Please try again."
      render :new
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])
    if @table.update_attributes(table_params)
      flash[:notice] = "Your Plan A Restaurant was updated!"
      redirect_to @table
    else
      flash[:error] = "There was an error saving your Plan A Restaurant. Please try again."
      render :edit
    end
  end

  private
  def table_params
    params.require(:table).permit(:title, :body)
  end
end
