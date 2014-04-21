
FactoryGirl.define do
  factory :wine100_profile, :class => Refinery::Wine100Profiles::Wine100Profile do
    sequence(:company_name_en) { |n| "refinery#{n}" }
  end
end

