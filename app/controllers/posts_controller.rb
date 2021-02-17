class PostsController < ApplicationController
  #ルーティングでposts#indexを定義しているので、postsコントローラーってのを作りましたということですね
  def index #indexという名前のインスタンスメソッドを定義しただけです
    @posts = Post.all.order(id: "DESC") #これをpostsディレクトリのindex.html.erbっていう対応したビューで使えるようになりますって話です
    #orderメソッドで並び順を変えられる
  end

  def create
    post = Post.create(content: params[:content], checked: false) #既読・未読の情報をchecked:falseで与えてます
    render json:{ post: post } #レスポンスはjsonでくださいねの記述
  end

  def checked
    post = Post.find(params[:id])
    #既読にするメモのIDを取得
    if post.checked #そのIDが既に既読かどうかの分岐
      post.update(checked: false)  #もし既読なら、既読解除のためにfalseに変更し、
    else #既読でなければ既読にするためにtrueを返しますということ
      post.update(checked: true)
    end

    item = Post.find(params[:id]) #ここで更新したレコードを改めて取得
    render json: { post: item } #ここでJSON形式でcheck.jsに返却
  end

end
