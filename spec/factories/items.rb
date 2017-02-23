FactoryGirl.define do
  factory :item do
    name           { Faker::Commerce.product_name }
    description    { Faker::Hipster.sentence }
    image_url      { Faker::Placeholdit.image }
    created_at     { DateTime.now }
    updated_at     { DateTime.now }
  end
end
