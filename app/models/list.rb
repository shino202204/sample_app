class List < ApplicationRecord
  # ActiveStorageを使って画像を表示する際には、
  # どのモデルに対して画像を使うのかを宣言する必要があります。
  # 以下の記述により、Listモデルにtitleとbodyに加えて
  # 画像を扱うためのimageカラムが追記されたかのように扱うことが出来ます。
  has_one_attached :image

  # バリデーションの設定：モデルのファイルに設定内容を記述
  # validatesで対象とする項目を指定、入力されたデータのpresence（存在）をチェック
  # true：データが存在しなければならないという設定になる
  validates :title, presence: true
  validates :body, presence: true

  # 「rails c」を試すときはimageのバリデーションをコメントアウト
  # 理由：rails cで画像を扱う場合は複雑になるため
  validates :image, presence: true
end
