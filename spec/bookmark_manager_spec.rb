require 'bookmark_manager'

describe BookmarkManager do
  it 'have all bookmarks' do
    subject = described_class
    expect(subject.all).to include('https://www.youtube.com/')
  end
end