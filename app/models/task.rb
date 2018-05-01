class Task < ApplicationRecord

  # Available statuses
  enum status: [ :pending, :in_progress, :completed ]

  # Associations
  belongs_to :project
  belongs_to :developer, class_name: "User", foreign_key: "developer_id"
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end
