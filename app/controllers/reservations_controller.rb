class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: 'Reserva criada com sucesso!'
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    if @reservation.user == current_user
      @reservation.destroy
      redirect_to reservations_path, notice: 'Reserva excluída com sucesso.'
    else
      redirect_to reservations_path, alert: 'Você não tem permissão para excluir esta reserva.'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:table_id, :date_time)
  end
end
