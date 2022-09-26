# frozen_string_literal: true

class User < ApplicationRecord
  include AuthorizedPersona::Persona

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
