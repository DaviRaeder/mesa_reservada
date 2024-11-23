class HomeController < ApplicationController
  def index
    @reserved_tables = Table.where(status: 'reservada')
    @available_tables = Table.where(status: 'disponível')
  end
end
