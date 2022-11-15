class Admin::GenresController < ApplicationController
  def index
    @genre=Genre.new
    @genres=Genre.all
  end

  def edit
    @genre= Genre.find(params[:id])
  end
  def create
      genre = Genre.new(genre_params)
      # 3. データをデータベースに保存するためのsaveメソッド実行
      genre.save
      # 4. トップ画面へリダイレクト
      redirect_to admin_genres_index_path
  end
  def update
    genre = Genre.find(params[:id])
    genre.update(genre1_params)
    redirect_to admin_genres_index_path  
  end
  private
    # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end
  def genre1_params
    params.permit(:name)
  end
end
