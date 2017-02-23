require 'rails_helper'

describe 'Items API' do
  context 'get item' do
    it 'returns item' do
      create_list(:item, 3)
      first_item = Item.find(1)

      get api_v1_item_path(first_item)

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item).to be_a Hash

      item_attributes.each do |attribute|
        expect(item).to have_key attribute
        expect(item[attribute]).to eq first_item.send(attribute)
      end

      expect(item).to_not have_key 'updated_at'
      expect(item).to_not have_key 'created_at'
    end
  end
end