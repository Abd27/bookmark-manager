require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/bookmark_manager'


class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/bookmark'
  end

  get '/bookmark' do
    @bookmarks = BookmarkManager.all
    erb(:bookmark)
  end



  run! if app_file == $PROGRAM_NAME
end  