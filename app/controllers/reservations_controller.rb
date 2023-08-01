class ReservationsController < ApplicationController
  def index
    @current_reservations = Reservation.where(date: Date.today).count
  end

  def new
    @current_reservations = Reservation.where(date: Date.today).count
  end

  def create
    reservation = current_user.reservations.new(date: Date.today)
  
    if reservation.save
      redirect_to reservations_path, notice: '予約しました'
    else
      redirect_to new_reservation_path, alert: '予約に失敗しました'
    end
  end


  def destroy
  end
end
