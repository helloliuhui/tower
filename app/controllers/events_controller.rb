class EventsController < ApplicationController

  def index
    @events = Event.all.order("created_at DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def create

  end
end
