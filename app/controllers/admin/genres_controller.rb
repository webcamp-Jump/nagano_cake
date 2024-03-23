class Admin::GenresController < ApplicationController
before_action :authenticate_admin!

  def index
    @genres = Genre.page(params[:page])
    @genre = Genre.new
  end

  def show
    redirect_to edit_admin_genre_path(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
      flash[:notice] = "ジャンルを追加しました。"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンルの追加に失敗しました。"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end


  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを変更しました。"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンルの変更に失敗しました。"
      render :edit
    end
  end


private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
