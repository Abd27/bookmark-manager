require 'bookmark_manager'

describe BookmarkManager do
  describe '.all' do
    it 'returns a list of bookmarks' do
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

  describe '.delete' do
    it 'deletes bookmark' do
      BookmarkManager.all
      BookmarkManager.save_bookmark('New URL', 'http://bookmarked-url.co.gb')
      id = described_class.all[0].id
      BookmarkManager.delete(id)
      expect(BookmarkManager.all).to be_empty
    end
  end

  describe '.update' do
    it 'deletes bookmark' do
      BookmarkManager.all
      BookmarkManager.save_bookmark('New URL', 'http://bookmarked-url.co.gb')
      id = described_class.all[0].id
      BookmarkManager.update('Changed', 'http://www.changed.com', id )
      expect(BookmarkManager.all[0].title).to eq('Changed')
    end
  end
end