FactoryBot.define do
  factory :user do
    user_name { 'テストユーザー' }
    email     { 'test@email.com' }
    password  { 'password' }
  end
end
