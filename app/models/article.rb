class Article < ApplicationRecord
  has_rich_text :body

  scope :drafts, -> { where(draft: true) }
end
