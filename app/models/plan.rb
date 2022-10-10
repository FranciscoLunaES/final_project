# frozen_string_literal: true

class Plan < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
end
