class EventsController < ApplicationController
  def index
    @events = Event.where()
  end

  def show
  end
end
