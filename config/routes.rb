Rails.application.routes.draw do
  get 'lists/new'
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  # HTTPメソッド'URL' => 'コントローラ#アクション'
  # URLと'コントローラ名#アクション名'の形が同じになる場合は、この部分を省略することができる

  # get 'homes/top' => 'homes#top'
  # 以下は省略形（上記と同じ意味になる）
  get 'top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
