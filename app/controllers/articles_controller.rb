class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_article, only: %i[show edit update destroy]
  before_action -> { authorize! Article }, only: %i[index show new create]
  before_action -> { authorize! @article }, only: %i[edit destroy]

  def index
    @articles = authorized_scope(Article.all)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to article_url(@article), notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
