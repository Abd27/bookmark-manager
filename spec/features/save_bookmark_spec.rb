feature 'adding a bookmark' do
  scenario 'adds the bookmark to database' do
    visit '/'
    fill_in 'add_bookmark', with: 'https://www.github.com/'
    fill_in 'title', with: 'Github'
    click_button 'Add'
    expect(page).to have_link('Github', href: 'https://www.github.com/')
  end
end