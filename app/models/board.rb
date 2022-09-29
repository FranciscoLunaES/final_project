class Board < ApplicationRecord
  belongs_to :user
  has_many :lists

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 15 }

  validates :visibility, inclusion: { in: %w[public private] }
end
