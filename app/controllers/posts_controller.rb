class PostsController < ApplicationController
  #ルーティングでposts#indexを定義しているので、postsコントローラーってのを作りましたということですね
  def index #indexという名前のインスタンスメソッドを定義しただけです
    @posts = Post.all.order(id: "DESC") #これをpostsディレクトリのindex.html.erbっていう対応したビューで使えるようになりますって話です
    #orderメソッドで並び順を変えられる
  end

  def create
    Post.create(content: params[:content])
    #これはPostモデルにActiveRecordメソッドのcreateを適用して、その後(カラム名:paramsの中身取り出したいのでparams[:content])と記載してますよ〜
    redirect_to action: :index
    #メモの保存後にトップページにリダイレクトされる記述
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: {post: item}
  end

end
