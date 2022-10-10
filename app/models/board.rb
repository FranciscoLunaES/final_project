class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 15 }

  validates :visibility, inclusion: { in: %w[public private] }
  has_one_attached :image, dependent: :destroy
end
