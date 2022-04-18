class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # データをDBに保存するためのsaveメソッド実行
    # saveメソッド：呼び出したModelインスタンスをDBへ保存する

    # モデルファイルに記述したバリデーションの結果を検出
    if @list.save
      # redirect_to '/top'を削除して、以下コードに変更
      # 詳細画面へリダイレクト
      redirect_to list_path(@list.id)
    else
      # 「render :アクション名」で同じコントローラの別アクションのViewを表示できる
      # saveメソッドで保存に失敗した場合、エラーメッセージが@list内に追加される
      # 以下のrenderの部分でredirect_toを使うとnewアクション内で再度@list = List.new が実行され、
      # @listが上書きされてエラーメッセージが消えてしまう。
      # 基本的には、エラーメッセージを扱う際にはrender、それ以外はredirect_toを扱うと覚える。
      render :new #バリデーション結果がfalseなら、新規投稿ページを再表示させる
    end
  end

  # 一覧画面用（投稿したList全てを表示）
  def index
    # allはメソッドの一種
    # モデルがやりとりしているDBのテーブル内の全レコードを取得
    # Listモデルがやりとりしているlistsテーブルの全レコードを取得
    @lists = List.all
  end

  # 詳細画面用
  def show
    # 詳細画面で呼び出される投稿データは、URLの/lists/:id内の:idで判別する
    # findメソッド：引数に一致するidカラムのレコードを取得する
    @list = List.find(params[:id])
  end

  # 編集画面用
  def edit
    @list = List.find(params[:id])
  end

  # 更新機能用
  # 対応するビューはなし。更新処理後はshowアクションにリダイレクト。
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  # 削除機能用
  # ビューの「削除」ボタンをクリックすると、削除リストのid付きでURLが送信されます。
  # 送られてきた削除idを元にレコードが探され、そのレコードを削除します。
  def destroy
    list = List.find(params[:id]) #データ（レコード）を1件取得
    list.destroy #データ（レコード）を削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
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
    params.require(:list).permit(:title, :body, :image)
  end

end
