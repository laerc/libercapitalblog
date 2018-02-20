class ArticlesController < ApplicationController
	def index
		#All the articles that were created before are now at the articles variable
  		@articles = Article.all
	end

	def show
		#article has an article with an especific id.
		@article = Article.find(params[:id])

	end

	def new
		@article = Article.new
	end

	def create
		#creates a new article
		@article = Article.new
		#takes the values
  		@article.title = params[:article][:title]
  		@article.body  = params[:article][:body]
  		#pull to the database
  		@article.save

  		#redirects the page
  		redirect_to article_path(@article)
	end	

	def destroy
		Article.find(params[:id]).destroy
		redirect_to action:"index"
	end
	
	def edit
		@article = Article.find(params[:id])
		@article.update(article_params)

		redirect_to article_path(@article)
	end
end
