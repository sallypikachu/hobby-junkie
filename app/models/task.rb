class Task < ActiveRecord::Base
  belongs_to :hobby
  validates :task_name, presence: true
  validates :hobby_id, presence: true
  validates :complete, inclusion: { in: [true, false] }
end
