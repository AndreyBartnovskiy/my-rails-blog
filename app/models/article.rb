class Article < ApplicationRecord
  include Enumerize

  STATUSES = %i[draft published].freeze

  has_rich_text :body

  enumerize :status, in: STATUSES, scope: :shallow, predicate: true

  scope :draft, -> { where(status: :draft) }
  scope :published, -> { where(status: :published) }
end
