class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show edit update destroy ]

  # GET /cats
  def index
    # `Cat.ransack` で Cat に対して ransack を使う
    # params[:q] には検索フォームで指定した検索結果が入る
    @search = Cat.ransack(params[:q])

    # デフォルトのソートを id 降順にする
    @search.sorts = 'id desc' if @search.sorts.empty?

    # `@search.result`で検索となる @cats を取得する
    # 検索結果に対しては kaminari の page メソッドをチェーンできる
    @cats = @search.result.page(params[:page])
  end

  # GET /cats/1
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats
  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      # redirect_to @cat, notice: "猫を登録しました。"
      flash.now.notice = "猫を登録しました。"
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /cats/1
  def update
    if @cat.update(cat_params)
      # redirect_to @cat, notice: "猫を更新しました。", status: :see_other
      flash.now.notice = "猫を更新しました。"
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /cats/1
  def destroy
    @cat.destroy!
    redirect_to cats_path, notice: "猫を削除しました。", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cat_params
      params.expect(cat: [ :name, :age ])
    end
end
