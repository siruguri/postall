module Api
  class TasksController < ApplicationController
    doorkeeper_for :all

    def index
      @tasks = Task.where(owner_id: doorkeeper_token.resource_owner_id)
      render json: @tasks
    end
  end

end

