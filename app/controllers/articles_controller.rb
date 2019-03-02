class ArticlesController < ApplicationController

  before_action :redirect_to_index, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.includes(:user).recent
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, notice: '投稿しました。'
    else
      flash.now[:alert] = '本文が入力されていません。'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.user_id == current_user.id
      if @article.update(article_params)
        redirect_to root_path, notice: '編集しました。'
      else
        flash.now[:alert] = '本文が入力されていません。'
        render :edit
      end
    end
  end

  def destroy
    @article.destroy if @article.user_id == current_user.id
    redirect_to root_path, notice: '削除しました。'
  end

  private
  def article_params
    params.require(:article).permit(:content).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def redirect_to_index
    unless user_signed_in?
      redirect_to root_path, notice: 'ログインしてください。'
    end
  end
end
