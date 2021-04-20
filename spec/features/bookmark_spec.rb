feature "bookmark-manager" do
  scenario "display the title" do
    visit "/"
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'display some bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
  
    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.youtube.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.freecodecamp.org/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.gov.uk/');")
  
    visit '/'
    expect(page).to have_content('https://www.youtube.com/')
    expect(page).to have_content('https://www.freecodecamp.org/')
    expect(page).to have_content('https://www.gov.uk/')
  end
end