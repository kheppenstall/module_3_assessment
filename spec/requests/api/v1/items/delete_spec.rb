require 'rails_helper'

describe 'Items API' do
  context 'valid id' do
    it 'returns 204 and removes item from database' do
      create_list(:item, 3)
      first_item = Item.first

      delete api_v1_item_path(first_item)

      expect(response.status).to eq 204
      expect(Item.count).to eq 2
      expect(Item.pluck(:id)).to_not include first_item.id
    end
  end

  context 'invalid id' do
    it 'returns 400' do
      delete '/api/v1/items/1'

      expect(response.status).to eq 400
    end
  end
end