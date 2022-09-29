# frozen_string_literal: true

class User < ApplicationRecord
  include AuthorizedPersona::Persona

  has_many :plans, dependent: :destroy
  has_many :boards, dependent: :destroy

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

  validates :authorization_tier, inclusion: { in: authorization_tier_names }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
