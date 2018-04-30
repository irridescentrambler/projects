class Project < ApplicationRecord

  # Associations
  belongs_to :manager, class_name: "User", foreign_key: "manager_id"
  has_and_belongs_to_many :developers, class_name: "User"
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :developers


  # Validations
  validates :name, :presence => true, :uniqueness => { scope: :manager_id }
end
