class Task < ApplicationRecord
  belongs_to :list

  has_many :TaskLabels
  has_many :labels, through: :TaskLabels

  has_many :user_tasks
  has_many :users, through: :user_tasks

  belongs_to :author, class_name: 'User'
  alias_attribute :user, :author

  validates :title, presence: true,
                    length: { minimum: 3, maximum: 50 }
end
