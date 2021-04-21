require 'bookmark_manager'

describe BookmarkManager do
  describe '.all' do
    it 'returns a list of bookmarks' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      BookmarkManager.all
      # Add the test data
      BookmarkManager.save_bookmark("Makers Academy", "http://www.makersacademy.com" )
      BookmarkManager.save_bookmark("Destroy All Software", "http://www.destroyallsoftware.com")
      BookmarkManager.save_bookmark("Google", "http://www.google.com")
      
      bookmarks = BookmarkManager.all
      expect(bookmarks[0].url).to eq('http://www.makersacademy.com')
      expect(bookmarks[1].url).to eq('http://www.destroyallsoftware.com')
      expect(bookmarks[2].url).to eq('http://www.google.com')
    end
  end

  describe '.save_bookmark' do
    it 'will add the bookmark to database' do
      BookmarkManager.all
      BookmarkManager.save_bookmark('Github', 'http://www.github.com')

      expect(BookmarkManager.all.first.url).to eq('http://www.github.com')
      expect(BookmarkManager.all.first.title).to eq('Github')
    end
  end
end