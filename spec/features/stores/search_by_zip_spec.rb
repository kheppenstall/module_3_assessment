# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results

require 'rails_helper'

describe 'User searches zip code' do
  context 'valid zip' do
    it 'returns count of stores within 10 miles and details of 10 stores' do
      visit root_path

      fill_in 'q', with: 80202
      click_on 'Search'

      expect(current_path).to eq search_path
      expect(page).to have_content '16 Total Stores'
      expect(page).to have_selector('.store', count: 10)
      within first('.store') do
        expect(page).to have_content 'Name:'
        expect(page).to have_content 'City:'
        expect(page).to have_content 'Distance:'
        expect(page).to have_content 'Phone Number:'
        expect(page).to have_content 'Store Type:'
      end
    end
  end
end