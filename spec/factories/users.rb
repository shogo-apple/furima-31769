FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@gmail.com"}
    password              {"a000000"}
    password_confirmation {password}
    last_name             {"佐藤"}
    first_name            {"花子"}
    last_name_kana        {"サトウ"}
    first_name_kana       {"ハナコ"}
    birth_date            {"2020-11-18"}
  end
end