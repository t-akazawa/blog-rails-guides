class ArticlesController < ApplicationController
  def new
  end

  def index
    # Article自体がArticleテーブルを示す？
    p Article.inspect
    @articles = Article.all
  end

  def create
    # @articleのようなインスタンス変数は全てビューに渡される1
    @article = Article.new(article_params)

    @article.save
    p "-----"
    p @article.inspect
    # http://railsdoc.com/references/redirect_to
    # @articleを渡すとarticle_urlに自動でリダイレクトするっぽい
    redirect_to @article
  end

  # paramsはフォームから送信されてきたパラメータ (つまりフォームのフィールド) を表すオブジェクト
  # .find: データベースから該当引数の情報を探す
  def show
    @article = Article.find(params[:id])
  end

  private
  # strong_parameter
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
