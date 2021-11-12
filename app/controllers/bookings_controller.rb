class BookingsController < ApplicationController
    def show
        @booking = Booking.find(params[:id])
        @review = Review.new
        authorize @booking
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
        if @booking.save
            redirect_to dashboard_path
        else
            @booking.start_date = @booking.start_date
            @booking.end_date = @booking.end_date
            render "porpoises/show"
        end
        authorize @booking
    end

    def update
        @booking = Booking.find(params[:id])
		authorize @booking
        @booking.send("#{params[:status]}!")
        # @booking.send("accepted!") => @booking.accepted! => enum
        redirect_to dashboard_path
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        authorize @booking
    
        redirect_to dashboard_path
    end

    private

    def booking_params
        params.require(:booking).permit(:status, :start_date, :end_date, :total_price)
    end

end
