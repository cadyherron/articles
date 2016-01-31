class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(whitelisted_article_params)
    if @article.save
      flash[:success] = "Article #{@article.id} successfully created"
    else
      flash[:error] = "Article #{@article.id} was not created"
    end
    redirect_to article_path(@article)
  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(whitelisted_article_params)
      flash[:success] = "Article #{@article.id} successfully saved"
    else
      flash[:error] = "Article #{@article.id} was not saved"
    end
    redirect_to article_path(@article)
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end




  def whitelisted_article_params
    params.require(:article).permit(:title, :body)
  end


end
