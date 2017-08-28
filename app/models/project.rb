class Project < ApplicationRecord
  belongs_to :users, :optional => true
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks

end
