require 'rails_helper'

describe 'Items API post' do
  context 'valid params' do
    it 'creates, saves, and returns item' do
      attributes = {
        name:         Faker::Commerce.product_name,
        description:  Faker::Hipster.sentence,
        image_url:    Faker::Placeholdit.image,
      }

      item_params = { item: attributes }

      post api_v1_items_path, item_params

      item = JSON.parse(response.body).symbolize_keys

      expect(response.status).to eq 201
      expect(item).to be_a Hash

      attributes.each do |key, value|
        expect(item).to have_key key
        expect(item[key]).to eq value
      end

      expect(item).to have_key :id
      expect(item).to_not have_key :created_at
      expect(item).to_not have_key :updated_at
    end
  end
end
