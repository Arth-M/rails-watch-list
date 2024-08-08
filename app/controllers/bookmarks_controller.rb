class BookmarksController < ApplicationController
  def index
  end

  def new
    @list=List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    movie_id = params[:bookmark][:movie_id]
    list_id = params[:list_id]
    @bookmark.movie_id = movie_id
    @bookmark.list_id = list_id
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @bookmark= Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to list_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
