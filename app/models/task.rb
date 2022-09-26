class Task < ApplicationRecord
  belongs_to :list

  has_many :TaskLabels
  has_many :labels, through: :TaskLabels
end
