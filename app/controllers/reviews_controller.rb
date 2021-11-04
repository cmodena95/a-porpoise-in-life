class ReviewsController < ApplicationController
    def index
        @porpoise = Porpoise.find(params[:id])
        

    end
end
