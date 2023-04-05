class Article < ApplicationRecord
  include Enumerize

  STATUSES = %i[draft published].freeze

  belongs_to :user
  
  has_rich_text :body

  enumerize :status, in: STATUSES, scope: :shallow, predicates: true

  scope :draft, -> { where(status: :draft) }
  scope :published, -> { where(status: :published) }
end
