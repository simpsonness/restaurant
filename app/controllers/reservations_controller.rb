class ReservationsController < ApplicationController
  before_filter :load_table

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @table.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "Reservation has been created successfully"
      redirect_to table_path(@table)
    else
      flash[:error] = "Reservation failed"
      render :new
    end
  end


  def edit
    
  end

  private
  def reservation_params
    params.require(:reservation).permit(:time, :people, :table_id, :user_id)
  end

  def load_table
    @table = Table.find(params[:table_id])
  end
end
