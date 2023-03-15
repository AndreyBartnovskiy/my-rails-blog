class AddDraftToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :draft, :boolean, default: false
  end
end
