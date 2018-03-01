class CommentsController < ApplicationController

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.save

    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def destroy
    @article = Article.friendly.find(params[:article_id])
    @article.comments.find(params[:id]).destroy
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.update(comment_params)

    redirect_to article_path(@article)
  end
end
