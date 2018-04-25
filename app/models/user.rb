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
end
