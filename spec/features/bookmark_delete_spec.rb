feature 'delete bookmark' do
  scenario 'can delete a bookmark' do
    visit '/'
    fill_in 'add_bookmark', with: 'https://www.github.com/'
    fill_in 'title', with: 'Github'
    click_button 'Add'

    click_button 'Github_delete'
    expect(page).to have_current_path('/')
    expect(page).not_to have_link('Github', href: 'https://www.github.com/')
  end
end