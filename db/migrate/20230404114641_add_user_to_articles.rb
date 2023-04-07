class AddUserToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, null: true, foreign_key: true
  end
end
