class PorpoisesController < ApplicationController
    def index
        @porpoises = policy_scope(Porpoise).order(created_at: :desc)
    end
end