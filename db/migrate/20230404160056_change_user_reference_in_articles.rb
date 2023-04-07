class ChangeUserReferenceInArticles < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :user_id, :integer, null: false
  end
end
