class List < ApplicationRecord
  # ActiveStorageを使って画像を表示する際には、
  # どのモデルに対して画像を使うのかを宣言する必要があります。
  # 以下の記述により、Listモデルにtitleとbodyに加えて
  # 画像を扱うためのimageカラムが追記されたかのように扱うことが出来ます。
  has_one_attached :image
end
