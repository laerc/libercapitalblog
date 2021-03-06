# This Class is the article controller
class ArticlesController < ApplicationController
  # Include the module
  include ArticlesHelper

  before_action :authenticate_user!,  except:[:index, :show]

  def index
    # All the articles that were created before are now at the articles variable
    @articles = Article.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    # article has an article with an especific id.
    @article = Article.friendly.find(params[:id])
    @comments = @article.comments.paginate(:page => params[:page], :per_page => 4)
    # creates a black comment.
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    # takes the values
    @article = current_user.articles.create(article_params)
    # @article = Article.new(article_params)
    # @article.user_id = current_user.id
    # pull to the database
    @article.save

    # redirects the page
    redirect_to article_path(@article)
  end

  def destroy
    Article.friendly.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  # creates an article to be updatted
  def edit
    @article = Article.friendly.find(params[:id])
  end

  # method that save the new configuration
  def update
    @article = Article.friendly.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end
end
