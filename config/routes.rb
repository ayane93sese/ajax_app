Rails.application.routes.draw do
  root to: 'posts#index'
#  get 'posts', to: 'posts#index' #意味合いとしては、postsというパスにgetメソッドのRQが送られてきたら、postsコントローラーのindexアクションを呼び出してねってことです
  #なので、とりあえずこの後に作るのはpostsコントローラーですね
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#checked' #どのメモを既読にしたのかを記録するため、メモのIDを取得するためのルーティング
end
