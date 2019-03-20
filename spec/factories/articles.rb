Factory.define do
  factory :article do
    content { 'テスト' }
    user
  end
end
