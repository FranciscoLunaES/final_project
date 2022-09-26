class Label < ApplicationRecord
  has_many :TaskLabels
  has_many :tasks, through: :TaskLabels
end
