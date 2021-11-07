class DashboardsController < ApplicationController
  skip_after_action :verify_authorized, only: :show
  after_action :verify_policy_scoped, only: :show
  # ^ makes it so that we can treat the show page as an index page and be able to use 'policy_scope' on it

  def show
    @applied_bookings = policy_scope(current_user.bookings).order(created_at: :desc)
    @received_bookings = policy_scope(current_user.received_bookings).order(created_at: :desc)    
  end
end
