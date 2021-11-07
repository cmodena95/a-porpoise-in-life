class BookingsController < ApplicationController
    def new
        @porpoise = Porpoise.find(params[:porpoise_id])
        authorize @booking
    end
    
    def create
        @porpoise = Porpoise.find(params[:porpoise_id])
        @booking = Booking.new(booking_params)
        @booking.porpoise = @porpoise
        @booking.user = current_user
        if @booking.save
            redirect_to dashboard_path
        else
            render "porpoises/show"
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
