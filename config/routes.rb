Rails.application.routes.draw do
  get 'posts', to: 'posts#index' #意味合いとしては、postsというパスにgetメソッドのRQが送られてきたら、postsコントローラーのindexアクションを呼び出してねってことです
  #なので、とりあえずこの後に作るのはpostsコントローラーですね
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
end
