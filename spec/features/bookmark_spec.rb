feature "bookmark-manager" do
  scenario "display the title" do
    visit "/"
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'display some bookmarks' do
    
   
    # Add the test data
    BookmarkManager.save_bookmark('Youtube', 'https://www.youtube.com/')
    BookmarkManager.save_bookmark('FreeCodeCamp', 'https://www.freecodecamp.org/')
    BookmarkManager.save_bookmark('Gov', 'https://www.gov.uk/')
    BookmarkManager.save_bookmark('www', 'https://www')
    visit '/'
    
    expect(page).to have_link('Youtube', href: 'https://www.youtube.com/')
    expect(page).to have_link('FreeCodeCamp', href: 'https://www.freecodecamp.org/')
    expect(page).to have_link('Gov', href: 'https://www.gov.uk/')
    expect(page).to have_link('www', href: 'https://www')

  end
end