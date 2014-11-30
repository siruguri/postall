module Api
  module V1
    class ApiBaseController < ApplicationController
      def initialize
        @api_response = {status: "Unknown error. This shouldn't have happened.", description: '', created_at: ''}
      end
      def api_action
        mesg=params[:action]
        self.send mesg
      end
      
      private
      def set_response_field(key, val)
        @api_response[key]=val
      end

      def set_response_success
        @api_response[:status]='success'
      end
      def set_response_failure
        @api_response[:status]='failure'
      end

      def send_response_success
        set_response_success
        send_response
      end

      def send_response_failure
        set_response_failure
        send_response
      end

      def send_response
        puts ">>> returning #{@api_response.to_json}"
        respond_to do |fmt| 
          fmt.json { render json: @api_response }
        end
      end
    end
  end
end

