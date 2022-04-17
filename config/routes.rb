Rails.application.routes.draw do
  get 'lists/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'homes/top' => 'homes#top'
  # 以下は省略形（上記と同じ意味になる）
  # HTTPメソッド'URL' => 'コントローラ#アクション'
  # URLと'コントローラ名#アクション名'の形が同じになる場合は、この部分を省略することができる
  get 'top' => 'homes#top'

  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'

  # ../lists/1や../lists/3に該当する
  # URLに投稿データのidを含める（表示する投稿データを判別するため）
  # このidはshowアクション内にparams[:id]と記述することで取得できる
  # as:オプション：名前付きルート
  get 'lists/:id' => 'lists#show', as: 'list'

  # 「,」と「:」の後ろにスペースを入れること
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'

  # PATCH：更新の場合のHTTPメソッド（POST：新規投稿の場合）
  patch 'lists/:id' => 'lists#update', as: 'update_list'
end
