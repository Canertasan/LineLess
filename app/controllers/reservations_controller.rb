# frozen_string_literal: true

class ReservationController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find params[:id]

    if @reservation
      # render the reservation details
    else
      # display an error message or redirect to a different page
    end
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation.id)
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find params[:id]
  end

  def reservation_params
    params.require(:reservation).permit(:name, :phone_number, :email, :number_of_people, :user_id)
  end
end
