require 'rails_helper'

describe 'User searches zip code' do
  context 'valid zip' do
    before do
      VCR.insert_cassette 'stores_by_zip', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

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