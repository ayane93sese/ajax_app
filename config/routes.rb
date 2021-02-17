Rails.application.routes.draw do
  root to: 'posts#index'
#  get 'posts', to: 'posts#index' #意味合いとしては、postsというパスにgetメソッドのRQが送られてきたら、postsコントローラーのindexアクションを呼び出してねってことです
  #なので、とりあえずこの後に作るのはpostsコントローラーですね
  post 'posts', to: 'posts#create'
end
