class PostsController < ApplicationController
  #ルーティングでposts#indexを定義しているので、postsコントローラーってのを作りましたということですね
  def index #indexという名前のインスタンスメソッドを定義しただけです
    @posts = Post.all #これをpostsディレクトリのindex.html.erbっていう対応したビューで使えるようになりますって話です
  end

  def new
  end

  def create
    Post.create(content: params[:content])
    #これはPostモデルにActiveRecordメソッドのcreateを適用して、その後(カラム名:paramsの中身取り出したいのでparams[:content])と記載してますよ〜
  end

end
