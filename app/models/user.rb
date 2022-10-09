# frozen_string_literal: true

class User < ApplicationRecord
  include AuthorizedPersona::Persona

  has_many :subscriptions

  has_many :plans, dependent: :destroy
  has_many :boards, dependent: :destroy

  has_many :members, class_name: 'User',
                     foreign_key: 'manager_id'

  belongs_to :manager, class_name: 'User', optional: true

  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  authorization_tiers(
    member: 'Member - limited access',
    manager: 'Manager - board access',
    admin: 'Admin - all access'
  )

  enum roles: { member: 'Member - limited access',
                manager: 'Manager - board access',
                admin: 'Admin - all access' }

  validates :authorization_tier, inclusion: { in: authorization_tier_names }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
