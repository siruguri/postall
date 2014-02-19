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
    @task = Task.find params[:id]
    params[:task].each do |k, v|
      @task.send("#{k}=", v)
    end
  end
    
  def create
    @task = Task.new params[:task]
    @task.owner=User.find_by_id current_user.id if current_user
    
    complete_update 'Task was successfully created.'
  end

  private
  def complete_update message
    @task.categories.build
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: message }
        # Let's return a 201
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        # Let's return a 422
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong params
  def task_strong_params(p)
    p.permit(:title, :due_date)
  end
end
