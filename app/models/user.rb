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

  # Associations
  has_many :managed_projects, class_name: "Project", foreign_key: "manager_id"
  has_and_belongs_to_many :projects, class_name: "Project"
  has_many :tasks, foreign_key: "developer_id"
end
