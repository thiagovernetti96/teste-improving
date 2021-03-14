class EventsController < ApplicationController
    def save_event

        event_params = JSON.parse(request.body.read)
    
        OctoEvent.create(
          :action => event_params["action"],
          :number => event_params["issue"]["number"]
        )
      end
    
      def get_events_by_issue
    
        if check_is_numeric(params[:issue_number]) && check_issue_number(params[:issue_number])
    
          events = 
            OctoEvent.select(:action, :created_at)
                    .where("number = ?", params[:issue_number])
                    .as_json(:except => :id)
    
          render json: events
    
        else
          render json: { 'error': 'Issue not found or invalid issue number informed' }, status: :bad_request
        end
    
      end
    
      private
    
      def check_is_numeric(string)
        true if Float(string) rescue false
      end
    
      def check_issue_number(string)
        OctoEvent.where("number = ?", params[:issue_number]).any?
      end
end
