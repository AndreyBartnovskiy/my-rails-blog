class PublicationsController < ApplicationController
  before_action :set_article, only: %i[create destroy]

  def create
    @article.update(status: :published)
    redirect_to article_path(@article), notice: "Article was successfully published."
  end

  def destroy
    @article.update(status: :draft)
    redirect_to article_path(@article), notice: "Article was successfully drafted."
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
