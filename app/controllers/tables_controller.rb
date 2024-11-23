class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to tables_path, notice: 'Mesa criada com sucesso!'
    else
      render :new
    end
  end

  private

  def table_params
    params.require(:table).permit(:identifier, :capacity, :status)
  end
end
