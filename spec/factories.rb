FactoryGirl.define do
  factory :entry do
    notes "MyText"
    ingredients "MyText"
    protein 1
    carbs 1
    fat 1
    day nil
  end
  factory :user do
    provider "MyString"
    uid "MyString"
    nickname "MyString"
    name "MyString"
    email "MyString"
    image_url "MyString"
    token "MyString"
  end
end
