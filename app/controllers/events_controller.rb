class EventsController < ApplicationController
   def new
   end
    def create
        @event = @current_user.events_created.build(events_params)
    end
    def index
        @events = @current_user.events_created.all
    end
    def show
        @event = @current_user.events_created.find(params[:id])
    end
end
