require 'pg'
class BookmarkManager
  attr_reader :url, :title, :id
  
  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end  

  def self.all
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = @connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| BookmarkManager.new(bookmark['url'], bookmark['title'], bookmark['id']) }
  end

  def self.save_bookmark(title, url)
    # connect_to_database
    @connection.exec("INSERT INTO bookmarks (title,url) VALUES('#{title}', '#{url}')")
  end  
  
end