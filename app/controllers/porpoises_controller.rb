class PorpoisesController < ApplicationController

    def index
        @porpoises = Porpoise.all
    end

end
