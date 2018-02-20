class ArticlesController < ApplicationController
	def index
		#All the articles that were created before are now at the articles variable
  		@articles = Article.all
	end

	def show
		#article has an article with an especific id.
		@article = Article.find(params[:id])

	end
end
