module Admin
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
        redirect_to admin_table_path(@table), notice: 'Mesa criada com sucesso!'
      else
        puts @table.errors.full_messages
        render :new
      end
    end

    def edit
      @table = Table.find(params[:id])
    end

    def update
      @table = Table.find(params[:id])

      if @table.update(table_params)
        redirect_to admin_table_path(@table), notice: 'Mesa atualizada com sucesso!'
      else
        render :edit
      end
    end

    def destroy
      @table = Table.find(params[:id])
      @table.destroy
      redirect_to admin_table_path, notice: 'Mesa excluída com sucesso.'
    end

    private

    def table_params
      params.require(:table).permit(:name, :capacity, :status, :description)
    end
  end
end
