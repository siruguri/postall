class TaskCategorization < ActiveRecord::Base

  belongs_to :task
  belongs_to :category
end
