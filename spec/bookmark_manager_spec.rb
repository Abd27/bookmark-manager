require 'bookmark_manager'

describe BookmarkManager do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
  
      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
  
      bookmarks = BookmarkManager.all
  
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.save_bookmark' do
    it 'will add the bookmark to database' do
      BookmarkManager.all
      BookmarkManager.save_bookmark('http://www.github.com')
      expect(BookmarkManager.all).to include('http://www.github.com')
    end
  end
end