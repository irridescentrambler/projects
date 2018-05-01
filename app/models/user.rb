class User < ApplicationRecord
  extend UserRoleHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :role, presence: true

  # Helper methods for roles
  roles :admin, :developer

  # Scopes
  scope :admin_users, -> { where(role: "admin") }
  scope :developer_users, -> { where(role: "developer") }

  # Associations
  has_many :managed_projects, class_name: "Project", foreign_key: "manager_id"
  has_and_belongs_to_many :projects, class_name: "Project"
  has_many :tasks, foreign_key: "developer_id"
  has_many :created_tasks, class_name: "Task", foreign_key: "creator_id"
end
