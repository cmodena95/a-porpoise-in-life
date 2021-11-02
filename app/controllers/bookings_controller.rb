class BookingsController < ApplicationController
    def index
        @applied_bookings = policy_scope(current_user.bookings).order(created_at: :desc)
        @received_bookings = policy_scope(current_user.received_bookings).order(created_at: :desc)
    end

    def new
        @porpoise = Porpoise.find(params[:porpoise_id])
        authorize @booking
    end
    
    def create
        @porpoise = Porpoise.find(params[:porpoise_id])
        @booking = Booking.new(booking_params)
        @booking.porpoise = @porpoise
        @booking.user = current_user
        @booking.status = "pending"
        if @booking.save
            redirect_to bookings_path
        else
            redirect_to porpoise_path(@porpoise.id)
        end
        authorize @booking
    end

    def update
        @booking = Booking.find(params[:id])
        if params[:query] == "accepted"
          @booking.status = "accepted"
          @booking.save
          redirect_to bookings_path
        elsif params[:query] == "declined"
          @booking.status = "declined"
          @booking.save
          redirect_to bookings_path
        end
        authorize @booking
    end

    private

    def booking_params
        params.require(:booking).permit(:status, :start_date, :end_date, :total_price)
    end

end
