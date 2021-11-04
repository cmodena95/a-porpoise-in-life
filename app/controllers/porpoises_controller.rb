class PorpoisesController < ApplicationController
    def index
        if params[:query].present?
            sql_query = "name ILIKE :query OR species ILIKE :query OR location ILIKE :query"
            @porpoises = policy_scope(Porpoise.where(sql_query, query: "%#{params[:query]}%")).order(created_at: :desc).geocoded
        else
            @porpoises = policy_scope(Porpoise).order(created_at: :desc).geocoded
        end

        @markers = @porpoises.map do |porpoise|
            {
              lat: porpoise.latitude,
              lng: porpoise.longitude,
              info_window: render_to_string(partial: "info_window", locals: { porpoise: porpoise }),
              image_url: helpers.asset_url('flower.png')
            }
        end
    end
    
    def show
        @porpoise = Porpoise.find(params[:id])
        @booking = Booking.new
        authorize @porpoise

        @markers = [{
            lat: @porpoise.latitude,
            lng: @porpoise.longitude,
            infoWindow: { content: render_to_string(partial: "info_window", locals: { porpoise: @porpoise }) }
          }]
    end

    def new
        @porpoise = Porpoise.new
        authorize @porpoise
    end

    def create
        @porpoise = Porpoise.new(porpoise_params)
        @porpoise.user = current_user
        if @porpoise.save
          redirect_to index_path
        else
          render :new
        end
        authorize @porpoise
    end

    def edit
        @porpoise = Porpoise.find(params[:id])
        authorize @porpoise
    end

    def update
        @porpoise = Porpoise.find(params[:id])
        @porpoise.update(porpoise_params)
        authorize @porpoise

        redirect_to porpoise_path(@porpoise)
    end

    def destroy
        @porpoise = Porpoise.find(params[:id])
        @porpoise.destroy
        authorize @porpoise
    
        redirect_to index_path
    end

    private

    def porpoise_params
        params.require(:porpoise).permit(:name, :location, :species, :price, photos: [])
    end
end