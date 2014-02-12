class Task < ActiveRecord::Base

  belongs_to :owner, class_name: "User"

  has_many :task_categorizations
  has_many :categories, through: :task_categorizations

  validates :title, presence: true

  accepts_nested_attributes_for :categories
end
