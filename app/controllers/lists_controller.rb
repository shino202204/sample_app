class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをDBに保存するためのsaveメソッド実行
    # saveメソッド：呼び出したModelインスタンスをDBへ保存するcrea
    list.save
    # トップ画面へリダイレクト
    redirect_to '/top'
  end

  # 一覧画面用（投稿したList全てを表示）
  def index
    # allはメソッドの一種
    # モデルがやりとりしているDBのテーブル内の全レコードを取得
    # Listモデルがやりとりしているlistsテーブルの全レコードを取得
    @lists = List.all
  end

  def show
  end

  def edit
  end

  # privateの行より後に定義されたメソッドは、アクションとして認識されなくなり、URLと対応できなくなる
  private

  # ストロングパラメータ
  # マスアサインメント脆弱性を防ぐ（保存カラムを限定することにより）
  # params：formから送られてくるデータが中に入っている
  # require：モデル名を指定する
  # permit：保存を許可するカラムを指定する

  # privateメソッドの名前：「モデル名_params」とすることが多い
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
