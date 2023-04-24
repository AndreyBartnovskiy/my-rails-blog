class User < ApplicationRecord
  extend Enumerize

  ROLES = %i[user admin].freeze

  has_many :articles, dependent: :destroy

  enumerize :role, in: ROLES, scope: :shallow, predicates: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
end
