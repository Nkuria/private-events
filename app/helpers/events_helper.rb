module EventsHelper
    def events_params
        params.require(:event).permit(:location, :event_date, :description)
    end
end
