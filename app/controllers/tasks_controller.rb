class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    # @tasks automatically set to Product.accessible_by(current_ability)
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @tasks }
    end
  end

  def new
    @task=Task.new

    @task.due_date = Date.today + 2.days
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    complete_update success_message: t(:successful_resource_update) do
      @task && @task.update_attributes(params[:task])
    end
  end
    
  def create
    @task = Task.new params[:task]

    # Attributes that are not set directly from the params hash should go here
    @task.owner=User.find_by_id current_user.id if current_user
    
    complete_update success_message: t(:successful_resource_creation) do 
      @task.save
    end
  end

  private
  def complete_update options_in
    options={success_http_status: :created, error_http_status: :unprocessable_entity, success_message: "Success!"}
    options=options.merge options_in

    @task.categories.build

    # If the task exists (in case this is an update), and it can be updated... 
    respond_to do |format|
      db_transaction_result = yield

      if db_transaction_result
        format.html { redirect_to @task, notice: "#{options[:success_message]}: task" }
        format.json { render json: @task, status: options[:success_http_status] }
      else
        flash[:alert]=:errors_found 
        format.html { render action: 'new'}
        # Let's return a 422 - we'll have to initialize an empty task if the params hash wasn't able to find one
        @task ||= Task.new
        format.json { render json: @task.errors, status: options[:error_http_status] }
      end
    end

  end

    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong params: this will be passed the params[resource] hash by default by before_action
  def task_strong_params(p)
    if p.nil?
      nil
    else
      p.permit(:title, :due_date, categories: []) 
    end
  end
end
