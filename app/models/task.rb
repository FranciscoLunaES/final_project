# frozen_string_literal: true

class Task < ApplicationRecord
  after_create :create_history
  before_update :create_history

  belongs_to :list

  has_many :TaskLabels
  has_many :labels, through: :TaskLabels
  has_one_attached :image, dependent: :destroy

  has_many :user_tasks
  has_many :users, through: :user_tasks

  belongs_to :author, class_name: 'User'
  alias_attribute :user, :author

  validates :title, presence: true,
                    length: { minimum: 3, maximum: 50 }

  has_many :task_histories, dependent: :destroy

  def create_history
    TaskHistory.create(task: self, list_name: list.name) if list_id_change
  end
end
