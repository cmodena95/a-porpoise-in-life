class BookingsController < ApplicationController
    def index
        @applied_bookings = policy_scope(current_user.bookings).order(created_at: :desc)
        # @received_bookings = policy_scope(current_user.bookings).order(created_at: :desc)
    end
end
