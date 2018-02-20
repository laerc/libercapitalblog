class ArticlesController < ApplicationController
	#include the module
	include ArticlesHelper

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
		@article = Article.new(article_params)

  		#pull to the database
  		@article.save

  		#redirects the page
  		redirect_to article_path(@article)
	end	

	def destroy
		Article.find(params[:id]).destroy
		redirect_to action:"index"
	end

	#creates an article to be updatted
	def edit
  		@article = Article.find(params[:id])
	end

	#method that save de new configuration
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end
end
