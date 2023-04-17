class User < ApplicationRecord
  extend Enumerize

  STATUSES = %i[user admin].freeze

  has_many :articles, dependent: :destroy

  enumerize :status, in: STATUSES, scope: :shallow, predicate: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
end
