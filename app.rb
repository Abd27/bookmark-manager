require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/bookmark_manager'


class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @bookmarks = BookmarkManager.all
    erb(:bookmark)
  end

  post '/save-bookmark' do

    BookmarkManager.all
    BookmarkManager.save_bookmark(params[:title], params[:add_bookmark],)
    redirect '/'
  end



  run! if app_file == $PROGRAM_NAME
end  