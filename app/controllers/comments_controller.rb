class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new

  end

  def create
  # @article = Article.find(params[:article_id])
  # @comment = @article.comment

  end


end
