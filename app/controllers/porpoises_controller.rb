class PorpoisesController < ApplicationController
    def index
        @porpoises = policy_scope(Porpoise).order(created_at: :desc)
    end
    
    def show
        @porpoise = Porpoise.find(params[:id])
        authorize @porpoise
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
        params.require(:porpoise).permit(:name, :location, :species, :price)
    end
end