feature 'adding a bookmark' do
  scenario 'adds the bookmark to database' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.github.com/');")
    visit '/'
    fill_in :add_bookmark, with: 'https://www.github.com/'
    click_button 'Add'
    expect(page).to have_content('https://www.github.com/')
  end
end