# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 15 }

  validates :priority, inclusion: { in: %w[Low Medium High] }
end
