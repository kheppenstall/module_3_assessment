require 'rails_helper'

describe 'Items API' do
  context 'get items' do
    it 'returns all items' do
      create_list(:item, 10)
      first_item = Item.first

      get api_v1_items_path

      items = JSON.parse(response.body)
      item  = items.first

      expect(response).to be_succes
      expect(items).to be_a Array
      expect(items.count).to eq 10

      item_attributes.each do |attribute|
        expect(item).to have_key attribute
        expect(item[attribute]).to eq first_item.send(attribute)
      end

      expect(item).to_not have_key 'updated_at'
      expect(item).to_not have_key 'created_at'
    end
  end
end