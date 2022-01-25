class BookmarksController < ApplicationController
  def new
    @list = Bookmark.new
  end

  def create

  end

  def destroy
    Bookmark.destroy(Bookmark.find(params[:id]))
  end
end
