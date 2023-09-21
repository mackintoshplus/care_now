class ReservationsController < ApplicationController
  def index
    @current_reservations = Reservation.where(date: Date.today).count
  end

  def new
    @current_reservations = Reservation.where(date: Date.today).count
    @user_has_reservation_today = current_user.reservations.where(date: Date.today).exists?
  end

  def create
    if current_user.reservations.where(date: Date.today).exists?
      redirect_to new_reservation_path, alert: '本日の予約は完了しております'
      return
    end
      
    
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
