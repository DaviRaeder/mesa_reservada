module Admin
  class ReservationsController < ApplicationController
    def index
      @reservations = Reservation.includes(:user, :table).all
    end

    def show
      @reservation = Reservation.find(params[:id])
    end

    def edit
      @reservation = Reservation.find(params[:id])
    end

    def update
      @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        redirect_to admin_reservation_path(@reservation), notice: 'Reserva atualizada com sucesso.'
      else
        render :edit
      end
    end

    def feedback
      @reservation = Reservation.find(params[:id])
      @reservation.add_feedback(params[:feedback])
      redirect_to admin_reservation_path(@reservation), notice: 'Feedback adicionado com sucesso.'
    end

    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      redirect_to admin_reservations_path, notice: 'Reserva excluída com sucesso.'
    end

    private

    def reservation_params
      params.require(:reservation).permit(:start_time, :end_time, :user_id, :table_id)
    end
  end
end
