require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/bookmark_manager'


class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions, :method_override
  before { @bookmarks = BookmarkManager.all }
  get '/' do
    # @bookmarks = BookmarkManager.all
    erb(:bookmark)
  end

  post '/save-bookmark' do

    # BookmarkManager.all
    BookmarkManager.save_bookmark(params[:title], params[:add_bookmark],)
    redirect '/'
  end

  delete '/bookmarks/:id' do
    # BookmarkManager.all
    BookmarkManager.delete(params[:id])
    redirect '/'
  end

  get '/bookmarks/:id/update' do
    @bookmark_id = params[:id]
    erb(:update)
  end

  patch '/bookmarks/:id' do
    BookmarkManager.update(params[:title], params[:url], params[:id])
    redirect('/')
  end



  run! if app_file == $PROGRAM_NAME
end  