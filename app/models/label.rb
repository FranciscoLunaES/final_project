# frozen_string_literal: true

class Label < ApplicationRecord
  has_many :TaskLabels
  has_many :tasks, through: :TaskLabels

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 50 }
end
