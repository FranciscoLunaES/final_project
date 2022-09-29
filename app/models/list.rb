class List < ApplicationRecord
  belongs_to :board
  has_many :tasks

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 15 }

  validates :priority, inclusion: { in: %w[low medium high] }
end
