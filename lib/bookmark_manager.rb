require 'pg'
class BookmarkManager
  @connection
  def self.all  
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
    # connection = PG.connect(dbname: 'bookmark_manager')
    result = @connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.save_bookmark(bookmark)
    @connection.exec("INSERT INTO bookmarks (url) VALUES('#{bookmark}')")
  end  
 # ALTER TABLE bookmark_manager ADD #{bookmark} VARCHAR(225)
end