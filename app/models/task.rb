class Task < ApplicationRecord
  belongs_to :list

  has_many :TaskLabels
  has_many :labels, through: :TaskLabels

  validates :title, presence: true,
                    length: { minimum: 3, maximum: 50 }
end
