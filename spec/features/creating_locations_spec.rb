feature 'Users can add new locations' do
  before do
    visit '/'
    click_link 'New Location'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Tokyo'

    click_button 'Create Location'

    expect(page).to have_content 'Location has been creted.'

    location = Location.find_by(name: 'Tokyo')

    expect(page.current_url).to eq location_url(location)
  end
end
