class EventsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @events = Event.where()
  end

  def show
    @event = Event.find(params[:id])
  end
end
