Rails.application.routes.draw do
  root to: 'posts#index'
#  get 'posts', to: 'posts#index' #意味合いとしては、postsというパスにgetメソッドのRQが送られてきたら、postsコントローラーのindexアクションを呼び出してねってことです
  #なので、とりあえずこの後に作るのはpostsコントローラーですね
  post 'posts', to: 'posts#create' 
  get 'posts/:id', to: 'posts#checked' #これが既読機能のエンドポイントのルーティング
end
