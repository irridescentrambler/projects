class Project < ApplicationRecord

  # Associations
  belongs_to :manager, class_name: "User", foreign_key: "manager_id"
  has_and_belongs_to_many :developers, class_name: "User"
  has_many :tasks
end
