class EventsController < ApplicationController
    include EventsHelper

   def new
        @event = current_user.events_created.new
   end

    def create
        @event = current_user.events_created.build(events_params)
        if @event.save
            redirect_to user_path(current_user), notice: 'Event created!'
        else
            redirect_to events_new_path, notice: 'Error creating event'
        end
    end

    def index
        @events = Event.all.order(:event_date)
    end

    def show
        @event = Event.includes(:attendees).find(params[:id])
    end
end
