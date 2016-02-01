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
      # redirect_to article_path(@article)
      redirect_to @article
    else
      flash.now[:error] = "Article #{@article.id} was not created"
      render :new
    end

  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(whitelisted_article_params)
      flash[:success] = "Article #{@article.id} successfully saved"
      redirect_to @article
    else
      flash[:error] = "Article #{@article.id} was not saved"
      render :edit
    end
  end


  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "Article #{@article.id} deleted"
      redirect_to articles_path
    else
      flash.now[:error] = "Article #{@article.id} was not deleted."
      render :show
  end




  def whitelisted_article_params
    params.require(:article).permit(:title, :body)
  end


end
