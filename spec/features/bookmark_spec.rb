feature "bookmark-manager" do
  scenario "display the title" do
    visit "/"
    expect(page).to have_content('Bookmark Manager')
  end

  scenario 'display some bookmarks' do
    visit '/'
    expect(page).to have_content('https://www.youtube.com/')
    expect(page).to have_content('https://www.freecodecamp.org/')
    expect(page).to have_content('https://www.gov.uk/')
  end
end