require 'sinatra'
require 'sinatra/reloader'


class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "it's working :D"
  end



  run! if app_file == $PROGRAM_NAME
end  