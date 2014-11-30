module Api
  module V1
    class TasksController < ApiBaseController
      # I'll restore this later when I re-understand how it works
      # doorkeeper_for :all

      def add_plan
        # set a failure response
        if (0)
          send_response_failure
          return
        end

        # success!
        send_response_success
      end
    end
  end
end

