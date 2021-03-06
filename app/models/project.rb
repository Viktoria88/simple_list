class Project < ApplicationRecord

  # belongs_to :user
  has_many :tasks, inverse_of: :project, :dependent => :destroy

  accepts_nested_attributes_for :tasks, reject_if: :new_record?, allow_destroy: true

end
