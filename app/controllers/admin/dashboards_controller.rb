module Admin
  class DashboardsController < ApplicationController
    def index
      @users_count = User.count
      @reservations_count = Reservation.count
      @tables_count = Table.count
    end
  end
end
