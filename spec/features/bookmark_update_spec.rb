feature 'update a bookmark' do
  scenario 'updates a book mark' do
    visit '/'
    fill_in 'add_bookmark', with: 'https://www.github.com/'
    fill_in 'title', with: 'Github'
    click_button 'Add'

    click_button 'Github_update'
    fill_in 'url', with: 'https://www.not_github.com/'
    fill_in 'title', with: 'NotGithub'
    click_button 'Update'

    expect(page).to have_current_path('/')
    expect(page).not_to have_link('Github', href: 'https://www.github.com/')
    expect(page).to have_link('NotGithub', href: 'https://www.not_github.com/')   
  end
end