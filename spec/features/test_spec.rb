feature "test" do
  scenario "test" do
    visit "/"
    expect(page).to have_content('it\'s working :D')
  end
end