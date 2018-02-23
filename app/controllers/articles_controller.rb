# This Class is the article controller
class ArticlesController < ApplicationController
  # Include the module
  include ArticlesHelper

  def slug
    @article.title.downcase.grub(' ', '-')
  end

  def to_param
    "#{slug}"
  end

  def index
    # All the articles that were created before are now at the articles variable
    @articles = Article.all
  end

  def show
    # article has an article with an especific id.
    @article = Article.find(params[:id])
    # creates a black comment.
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @status = false
    # creates a new article
    @article = Article.new
    # takes the values
    @article = Article.new(article_params)
    @status = true
    # pull to the database
    @article.save

    # redirects the page
    redirect_to article_path(@article)
    @status = false
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  # creates an article to be updatted
  def edit
    @article = Article.find(params[:id])
  end

  # method that save the new configuration
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end
end
